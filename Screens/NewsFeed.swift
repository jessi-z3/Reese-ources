////
////  NewsFeed.swift
////  Reese-ources
////
////  Created by Jessi Zimmerman on 9/18/23.
////
//
//import SwiftUI
//import Foundation
//
//struct Root: Decodable {
//    let pledges: [Pledge]
//}
//
//struct Pledge: Codable, Hashable {
//    let name: String
//    let city: String
//    let age: Int
//}
//extension Pledge {
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case city = "city"
//        case age = "age"
//    }
//}
//
//
//
//
//class ViewModel: ObservableObject{
//    @Published var pledges: Root = Root(pledges: [Pledge(name: "Test", city: "Tester", age: 13)])
//    func fetch() {
//        guard let url = URL(string: "https://yellowbird.dev/pledges.json") else{
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url ){ data, _, error in
//            guard let data = data, error == nil else{
//                return
//            }
//        do {
//            self.pledges = try JSONDecoder().decode(Root.self, from:data)
//            print(self.pledges)
//        }
//        catch {
//            print(error)
//        }
//    }
//    task.resume()
//}
//    
//    
//    
//    
//func post(name: String, city: String, age: Int) async {
//    let pledge = Pledge(name: name, city: city, age: age)
//    guard let url = URL(string: "https://yellowbird.dev/pledges.json") else{
//        return
//    }
//    guard let encoded = try? JSONEncoder().encode(pledge) else{
//        print("Failed to encode.")
//        return
//    }
//    var request = URLRequest(url: url)
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.httpMethod = "POST"
//    request.httpBody = encoded
//    do {
//        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
//        // handle the result
//        let decodedPledges = try JSONDecoder().decode(Root.self, from: data)
//        print(response)
//    } catch {
//            print("Signing failed. \(error)")
//        }
//    }
//}
//
//
//
//
//
//struct NewsFeed: View {
//    @StateObject var viewModel = ViewModel()
//    @State var name = ""
//    @State var city = ""
//    @State var age: Int = 13
//    @State var signing = false
//    var body: some View {
//        ScrollView{
//            Text(" Pledge Wall ").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
//            Button{
//                signing.toggle()
//            }label: {
//                Text("Sign the Pledge")
//                    .font(.custom("Gabriela-Regular", size: 24))
//            }
//            .buttonStyle(.borderedProminent)
//            if signing{
//                VStack(alignment: .trailing){
//                    HStack{
//                        Text("Name: ")
//                            .font(.custom("Gabriela-Regular", size: 22))
//                            .foregroundStyle(.white)
//                        TextField("", text: $name)
//                            .textFieldStyle(.roundedBorder)
//                            .frame(width: 200)
//                    }
//                    HStack{
//                        Text("City: ")
//                            .font(.custom("Gabriela-Regular", size: 22))
//                            .foregroundStyle(.white)
//                        TextField("", text: $city)
//                            .textFieldStyle(.roundedBorder)
//                            .frame(width: 200)
//
//                    }
//                    HStack{
//                        Spacer()
//                        Text("Age: ")
//                            .font(.custom("Gabriela-Regular", size: 22))
//                            .foregroundStyle(.white)
//                        Picker("", selection: $age){
//                            ForEach(5...99, id: \.self) { val in
//                                Text(val.description)
//                            }
//                        }
//                        .pickerStyle(.automatic)
//                        .frame(width: 200)
//                        .accentColor(.white)
//                    }
//                    .frame(width: 300)
//
//                    Button{
//                        Task{
//                            await viewModel.post(name: name, city: city, age: age)
//                        }
//                    }label: {
//                        Text("Sign")
//                            .font(.custom("Gabriela-Regular", size: 18))
//                    }
//                    .buttonStyle(.borderedProminent)
//                }
//                .frame(width: 300)
//                .padding(.vertical)
//            }
//            VStack(spacing: 10){
//                ForEach(viewModel.pledges.pledges, id: \.self){ pledge in
//                    PledgeView(pledge: pledge)
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("reeseblue"))
//        .onAppear{
//            viewModel.fetch()
//        }
//    }
//}
//
//#Preview {
//    NewsFeed()
//}
