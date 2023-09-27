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
            RoundedRectangle(cornerRadius: 45)
                .fill(Color("reeselightblue"))
                .frame(width: 275, height: 85)
            VStack{
                Text("\(pledge.name)")
                    .font(.custom("Gabriela-Regular", size: 24))
                Text("\(pledge.city)")
                        .font(.custom("Gabriela-Regular", size: 18))
                Text("\(pledge.age)")
                            .font(.custom("Gabriela-Regular", size: 18))
            }
        }
        .foregroundColor(Color.accentColor)
        .frame(width: 275, height: 85)
    }
    init(pledge: Pledge) {
        self.pledge = pledge
    }
}


