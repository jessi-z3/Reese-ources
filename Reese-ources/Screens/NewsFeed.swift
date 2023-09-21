//
//  NewsFeed.swift
//  Reese-ources
//
//  Created by Jessi Zimmerman on 9/18/23.
//

import SwiftUI
import Foundation


struct Pledge: Codable {
    let name: String
    let city: String
    let age: String
    let date: String
}
extension Pledge {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case city = "city"
        case age = "age"
        case date = "date"
    }
}

struct PledgeModel: Codable {
    var pledges: [Pledge]?
}
struct PledgeDataModel: Codable {
    var data:PledgeModel?
}

class PledgeViewModel{
    private var sourceURL = URL(string: "https://yellowbird.dev/pledges.json")!
    var pledgeModel: DataModel?
    
    func getAllPledges(completion: @escaping () -> ()) {
        URLSession.shared.dataTask(with: sourceURL ){[weak self](data, response, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalData = try! jsonDecoder.decode(DataModel.self, from:data)
                self?.pledgeModel = finalData
                completion()
            }
        }.resume()
    }}

    
struct NewsFeed: View {
    @State private var viewModel = PledgeViewModel()
    @State var pledges: [Pledge]?
    var body: some View {
        ScrollView{
            Text(" Pledge Wall ").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
            
            if(pledges!.isEmpty){
                Text("None")
            }else{ 
                VStack(spacing: 10){
                    ForEach(pledges!){ pledge in
                        ZStack{
                            RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 315, height: 125)
                            VStack{
                                Text("Name: \(pledge.name)")
                                Text("City: \(pledge.city)")
                                Text("Age: \(pledge.age)")
                                VStack{
                                    Text("Date: \(pledge.date)")
                                }.foregroundColor(Color.white).font(.custom("Gabriela-Regular", size: 18))
                            }.foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 22))
                            
                        }
                    }
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("reeseblue"))
    }
    
}

#Preview {
    NewsFeed()
}
