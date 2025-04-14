//
//  NewsFeed.swift
//  Reese-ources
//
//  Created by Jessi Zimmerman on 9/18/23.
//

import SwiftUI
import Foundation
import CloudKit

struct Root: Codable {
    var pledges: [Pledge]
}

struct Pledge: Codable, Hashable {
    let name: String
    let city: String
    let age: Int
}
extension Pledge {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case city = "city"
        case age = "age"
    }
}


struct PledgeModel: Codable{
    var data: Root?
}

class ViewModel: ObservableObject{
    @Published var pledges: Root = Root(pledges: [Pledge(name: "Test", city: "Tester", age: 13)])
    @Published var hasSigned: Bool {
        didSet {
            UserDefaults.standard.set(hasSigned, forKey: "hasSigned")
        }
    }
    @Published var showInappropriateContentAlert = false

    init() {
        self.hasSigned = UserDefaults.standard.bool(forKey: "hasSigned")
    }
    
    private let container = CKContainer(identifier: "iCloud.reesewall")
    private var database: CKDatabase { container.publicCloudDatabase }
    
    private func containsInappropriateContent(_ text: String) -> Bool {
        let inappropriateWords = ["badword1", "badword2", "inappropriate"] // Add real inappropriate words here
        let lowercasedText = text.lowercased()
        return inappropriateWords.contains { lowercasedText.contains($0) }
    }

    func fetch() {
        let query = CKQuery(recordType: "Pledge", predicate: NSPredicate(value: true))
        database.perform(query, inZoneWith: nil) { records, error in
            if let records = records {
                DispatchQueue.main.async {
                    self.pledges = Root(pledges: records.compactMap { record in
                        if let name = record["name"] as? String,
                           let city = record["city"] as? String,
                           let age = record["age"] as? Int {
                            return Pledge(name: name, city: city, age: age)
                        }
                        return nil
                    })
                }
            } else if let error = error {
                print("CloudKit fetch error: \(error)")
            }
        }
    }

    func post(name: String, city: String, age: Int) async {
        if containsInappropriateContent(name) || containsInappropriateContent(city) {
            await MainActor.run {
                self.showInappropriateContentAlert = true
            }
            return
        }

        let record = CKRecord(recordType: "Pledge")
        record["name"] = name as CKRecordValue
        record["city"] = city as CKRecordValue
        record["age"] = age as CKRecordValue

        do {
            let savedRecord = try await database.save(record)
            print("✅ Successfully saved pledge: \(savedRecord)")
            await MainActor.run {
                self.fetch()
                self.hasSigned = true
            }
        } catch {
            print("❌ CloudKit save error: \(error)")
        }
    }
}

struct NewsFeed: View {
    @StateObject var viewModel = ViewModel()
    @State var name = ""
    @State var city = ""
    @State var age: Int = 13
    @State var signing = false
    @State private var showAlert = false

    var body: some View {
        ScrollView{
            Text(" Pledge Wall ").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
            if !viewModel.hasSigned {
                Button {
                    signing.toggle()
                } label: {
                    Text("Sign the Pledge")
                        .font(.custom("Gabriela-Regular", size: 24))
                }
                .buttonStyle(.borderedProminent)
            }
            if viewModel.hasSigned {
                VStack {
                    Text("Thank you for signing the pledge!")
                        .font(.custom("Gabriela-Regular", size: 22))
                        .foregroundStyle(.white)
                    Button("Sign for Someone Else") {
                        name = ""
                        city = ""
                        age = 13
                        viewModel.hasSigned = false
                        signing = true
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else if signing {
                VStack(alignment: .trailing){
                    HStack{
                        Text("Name: ")
                            .font(.custom("Gabriela-Regular", size: 22))
                            .foregroundStyle(.white)
                        TextField("", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 200)
                    }
                    HStack{
                        Text("City: ")
                            .font(.custom("Gabriela-Regular", size: 22))
                            .foregroundStyle(.white)
                        TextField("", text: $city)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 200)

                    }
                    HStack{
                        Spacer()
                        Text("Age: ")
                            .font(.custom("Gabriela-Regular", size: 22))
                            .foregroundStyle(.white)
                        Picker("", selection: $age){
                            ForEach(5...99, id: \.self) { val in
                                Text(val.description)
                            }
                        }
                        .pickerStyle(.automatic)
                        .frame(width: 200)
                        .accentColor(.white)
                    }
                    .frame(width: 300)

                    Button{
                        Task{
                            await viewModel.post(name: name, city: city, age: age)
                        }
                    }label: {
                        Text("Sign")
                            .font(.custom("Gabriela-Regular", size: 18))
                    }
                    .buttonStyle(.borderedProminent)
                }
                .frame(width: 300)
                .padding(.vertical)
            }
            VStack(spacing: 10){
                ForEach(viewModel.pledges.pledges, id: \.self){ pledge in
                    PledgeView(pledge: pledge)
                }
            }
        }
        .refreshable {
            viewModel.fetch()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("reeseblue"))
        .onAppear{
            viewModel.fetch()
            if viewModel.hasSigned {
                signing = true
            }
        }
        .onChange(of: viewModel.showInappropriateContentAlert) { newValue in
            showAlert = newValue
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Inappropriate Content Detected"),
                  message: Text("Your post contains inappropriate content and has been blocked."),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    NewsFeed()
}
