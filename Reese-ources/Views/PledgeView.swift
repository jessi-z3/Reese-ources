//
//  PledgeView.swift
//  Reese-ources
//
//  Created by Jessi Zimmerman on 9/20/23.
//

import SwiftUI

struct PledgeView: View {
    private let pledge: Pledge
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 315, height: 125)
            VStack(alignment: .leading){
                Text("Name: \(pledge.name)")
                Text("City: \(pledge.city)")
                Text("Age: \(pledge.age)")
                VStack{
                    Text("Date: \(pledge.date)")
                }.foregroundColor(Color.white).font(.custom("Gabriela-Regular", size: 18))
            }.foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 22))
            
        }
    }
    init(pledge: Pledge) {
        self.pledge = pledge
    }
}


