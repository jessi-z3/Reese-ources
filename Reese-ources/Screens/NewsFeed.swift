//
//  NewsFeed.swift
//  Reese-ources
//
//  Created by Jessi Zimmerman on 9/18/23.
//

import SwiftUI
import Foundation


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
class ViewModel: ObservableObject{
    @Published var pledges: [Pledge] = []
    func fetch() {
        guard let url = URL(string: "https://yellowbird.dev/pledges.json") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url ){ [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let pledges = try JSONDecoder().decode([Pledge].self, from:data)
                DispatchQueue.main.async{
                    self?.pledges = pledges
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    func post() {
        guard let url = URL(string: "https://yellowbird.dev/pledges.json") else{
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let pledge: [String: Any] = [
            "name": "Jane",
            "city": "New York",
            "age": 18,
        ]
        request.httpBody = pledge.percentEncoded()

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
            else {                                                               // check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            // do whatever you want with the `data`, e.g.:
            
            do {
                let responseObject = try JSONDecoder().decode(Pledge.self, from: data)
                print(responseObject)
            } catch {
                print(error) // parsing error
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                } else {
                    print("unable to parse response as string")
                }
            }
        }

        task.resume()
        
    }
}
struct NewsFeed: View {
    @StateObject var viewModel = ViewModel()
    @State var name = ""
    @State var city = ""
    @State var age = ""
    @State var signing = false
    var body: some View {
        ScrollView{
            Text(" Pledge Wall ").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
            Button{
                signing.toggle()
            }label: {
                Text("Sign the Pledge")
                    .font(.custom("Gabriela-Regular", size: 24))
            }
            .buttonStyle(.borderedProminent)
            if signing{
                VStack{
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    TextField("City", text: $city)
                        .textFieldStyle(.roundedBorder)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                    Button{
                        viewModel.post()
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
                ForEach(viewModel.pledges, id: \.self){ pledge in
                    PledgeView(pledge: pledge)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("reeseblue"))
        .onAppear{
            viewModel.fetch()
        }
    }
}
extension Dictionary {
    func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

#Preview {
    NewsFeed()
}
