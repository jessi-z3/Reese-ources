//
//  Spotlight.swift
//  Reese-ources
//
//  Created by Jessi on 6/14/23.
//

import SwiftUI

struct Spotlight: View {
    var body: some View {
            VStack{
                Text("Spotlight")
                    .font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white).padding(.bottom)
                Image("reececarrbravepledges").resizable().scaledToFit()
                Spacer(minLength: 50)
                VStack{
                    Text("B.R.A.V.E. Bracelets").font(.custom("DancingScript-Bold", size: 30)).foregroundColor(.white)
                    Image("brave-bracelets").resizable().scaledToFit()
                    Text("Over the years, Reese has sent B.R.A.V.E. bracelets to every state, even some to Spain.")
                        .font(.custom("Gabriela-Regular", size: 20))
                        .foregroundColor(Color.indigo)
                }.padding(15)
                VStack{
                Text("Buddy Bench").font(.custom("DancingScript-Bold", size: 30)).foregroundColor(.white)
                Image("bottle-caps").resizable().scaledToFit()
                    Text("Reese washing and sorting bottle caps to be recycled for a B.R.A.V.E. buddy bench, so no kid has to sit alone. It takes over 150 lbs. of caps to make one. Way to Reese-cycle!")
                        .font(.custom("Gabriela-Regular", size: 20))
                        .foregroundColor(Color.indigo)
                }.padding(15)
                VStack{
                Text("Isabella the Brave").font(.custom("DancingScript-Bold", size: 30)).foregroundColor(.white)
                Image("Paisley").resizable().scaledToFit()
                    Text("'Isabella the Brave' is a children's book by Paisley Langworthy, written on inclusion, kindness, and friendships for all. Her inspiration for the book was her little sister Isabella Blue who made her a big sister in 2022. The book also forwards the mission of the Miss High School America organization's promotion of B.R.A.V.E.")
                        .font(.custom("Gabriela-Regular", size: 20))
                        .foregroundColor(Color.indigo)
                }.padding(15)
            }
        }
}

struct Spotlight_Previews: PreviewProvider {
    static var previews: some View {
        Spotlight().frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("reeseblue"))
    }
}
