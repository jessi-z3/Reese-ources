//
//  Spotlight.swift
//  Reese-ources
//
//  Created by Jessi on 6/14/23.
//

import SwiftUI

struct Spotlight: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("Spotlight")
                    .font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white).padding(.bottom)
                Text("Hello! My name is Reese Carr and I am honored to be your Miss Heartland Teen USA! I fell in love with pageantry at age 7 and have been competing ever since! I have been an anti- bullying advocate for years now and I have learned all of the hard lessons of being the victim and I want to teach others, with my story, that they are not alone. I understand all of the hardships and challenges of being bullied and I want to help others work through and understand their own. This is a safe space, Reese-ources and myself will always be by your side through it all!")
                    .font(.custom("Gabriela-Regular", size: 20))
                    .foregroundColor(Color.indigo)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(15)
                VStack{
                    Text("Buddy Bench").font(.custom("DancingScript-Bold", size: 30)).foregroundColor(.white)
                    Image("bottle-caps").resizable().scaledToFit()
                    Text("Reese washing and sorting bottle caps to be recycled for a buddy bench, so no kid has to sit alone. It takes over 150 lbs. of caps to make one. Way to Reese-cycle!")
                        .font(.custom("Gabriela-Regular", size: 20))
                        .foregroundColor(Color.indigo)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(15)
                VStack{
                    Text("Isabella the Brave").font(.custom("DancingScript-Bold", size: 30)).foregroundColor(.white)
                    Image("Paisley").resizable().scaledToFit()
                    Text("'Isabella the Brave' is a children's book by Paisley Langworthy, written on inclusion, kindness, and friendships for all. Her inspiration for the book was her little sister Isabella Blue who made her a big sister in 2022.")
                        .font(.custom("Gabriela-Regular", size: 20))
                        .foregroundColor(Color.indigo)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(15)
            }
        }
    }
}

struct Spotlight_Previews: PreviewProvider {
    static var previews: some View {
        Spotlight().frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("reeseblue"))
    }
}
