//
//  ScoreView.swift
//  MVVM
//
//  Created by Emmanuel Ugwuoke on 15/10/2022.
//

import SwiftUI

struct ScoreView: View {
    
    var score = 0
    var total = 0
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                Image("trophy").resizable().aspectRatio( contentMode: .fit).frame(width: 100.0)
                Text("Congratulations")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
                Text("Your Score")
                    .font(.custom("DancingScript-Bold", size: 65)).foregroundColor(.white).padding(.all)
                Text("\(score)/\(total)")
                    .font(.custom("DancingScript-Bold", size: 50)).foregroundColor(.white).padding(.all)
                
                Text("You did a great job. Try to beat your best score or check out some other activities.")
                    .font(.custom("Gabriela-Regular", size: 22))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                    .padding(.all)
                Spacer()
                NavigationLink{
                    ContentView()
                }label: {
                    Text("Back to Home")
                }
                    .padding(.all)
                    .background(Color("reeselightblue"))
                    .foregroundColor(.accentColor)
                    .font(.custom("Gabriela-Regular", size: 18))
                    .cornerRadius(15)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("reeseblue"))
            
        }
            .navigationTitle("ScoreView")
            .navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}
 
struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
