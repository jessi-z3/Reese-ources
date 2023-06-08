//
//  ContentView.swift
//  Reese-ources
//
//  Created by Jessi on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Image("icons8-bookshelf-100").resizable().frame(width: 60, height: 60).cornerRadius(15).padding()
                    Image("icons8-crayon-100").resizable().frame(width: 60, height: 60).cornerRadius(15).padding()
                    Image("icons8-danger-100").resizable().frame(width: 60, height: 60).cornerRadius(15).padding()
                }
                
                Image("Logo")
                    .resizable().scaledToFit().frame(height: 220).padding(15)
                VStack{
                    HStack{
                        NavigationLink{
                        PDFViewView(name: "Mission")
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 125)
                                Text("Mission").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24))
                                
                            }}.padding(5)
                        NavigationLink{
                        PDFViewView(name: "Program")
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 125)
                                Text("Program").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24))
                                
                            }}.padding(5)
                        
                    }
                    HStack{
                        NavigationLink{
                        PDFViewView(name: "BRAVE")
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 125)
                                Text("Be B.R.A.V.E.").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24))
                                
                            }}.padding(5)
                        NavigationLink{
                        PDFViewView(name: "Pledge")
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 170, height: 125)
                                Text("Pledge").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24))
                                
                            }}.padding(5)
                    }
                }
                Image("brave-logo2x")
                    .resizable().scaledToFit()
 
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("reeseblue"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
