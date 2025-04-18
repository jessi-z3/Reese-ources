//
//  ContentView.swift
//  Reese-ources
//
//  Created by Jessi on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    HStack{
//                        NavigationLink{
//                            NewsFeed()
//                        } label: {
//                            Image("icons8-news-feed-100").resizable().frame(width: 45, height: 45).cornerRadius(10).padding()
//                        }
                        NavigationLink{
                            BookList()
                        } label: {
                            Image("icons8-bookshelf-100").resizable().frame(width: 45, height: 45).cornerRadius(10).padding()
                        }
                        NavigationLink{
                            Activities()
                        }label:{
                            Image("icons8-crayon-100").resizable().frame(width: 45, height: 45).cornerRadius(10).padding()
                        }
                        NavigationLink{
                            Help()
                        }label:{
                            Image("icons8-danger-100").resizable().frame(width: 45, height: 45).cornerRadius(10).padding()
                        }
                    }
                    
                    Image("Logo 1")
                        .resizable().scaledToFit().frame(height: 195).padding(5)
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
    
                    Spotlight()
                }
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
