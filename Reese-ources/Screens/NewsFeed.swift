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
}
struct NewsFeed: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ScrollView{
            Text(" Pledge Wall ").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
            VStack{
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

#Preview {
    NewsFeed()
}
