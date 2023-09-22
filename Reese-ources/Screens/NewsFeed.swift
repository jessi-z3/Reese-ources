//
//  NewsFeed.swift
//  Reese-ources
//
//  Created by Jessi Zimmerman on 9/18/23.
//

import SwiftUI
import Foundation


struct Pledge: Codable, Identifiable, Comparable {
    static func < (lhs: Pledge, rhs: Pledge) -> Bool {
        return lhs.date < rhs.date
    }
    
    let id = Date()
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
    var pledgeModel: PledgeDataModel?
    
    func getAllPledges(completion: @escaping () -> ()) {
        URLSession.shared.dataTask(with: sourceURL ){[weak self](data, response, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalData = try! jsonDecoder.decode(PledgeDataModel.self, from:data)
                self?.pledgeModel = finalData
                completion()
            }
        }.resume()
    }
}

    
struct NewsFeed: View {
    @State private var viewModel = PledgeViewModel()
    @State var pledges: [Pledge]?
    @State private var nextIndex = 0

    var body: some View {
        ScrollView{
            Text(" Pledge Wall ").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
            VStack(spacing: 10){
                if pledges?[nextIndex] != nil {
                    let pledge = pledges![nextIndex]
                    PledgeView(pledge: pledge)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("reeseblue"))
        .onAppear{
            viewModel.getAllPledges(completion: {
                let pledgeData = viewModel.pledgeModel
                
                if let data = pledgeData {
                    if let ps = data.data {
                        pledges = ps.pledges
                        
                    }
                }
            })
        }
    }
}

#Preview {
    NewsFeed()
}
