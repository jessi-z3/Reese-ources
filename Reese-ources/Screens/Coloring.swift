//
//  Coloring.swift
//  Reese-ources
//
//  Created by Jessi on 6/8/23.
//

import SwiftUI

struct Coloring: View {
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Coloring Pages")
                    .font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
                VStack{
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness1-1")
                        } label: {
                            Image("Kindness1-1").resizable()
                        }
                        NavigationLink{
                            PDFViewView(name: "Kindness1-2")
                        } label: {
                            Image("Kindness1-2").resizable()
                        }
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness1-3")
                        } label: {
                            Image("Kindness1-3").resizable()
                        }
                        NavigationLink{
                            PDFViewView(name: "Kindness2-1")
                        } label: {
                            Image("Kindness2-1").resizable()
                        }
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness2-2")
                        } label: {
                            Image("Kindness2-2").resizable()
                        }
                        NavigationLink{
                            PDFViewView(name: "Kindness2-3")
                        } label: {
                            Image("Kindness2-3").resizable()
                        }
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness2-4")
                        } label: {
                            Image("Kindness2-4").resizable()
                        }
                        NavigationLink{
                            PDFViewView(name: "Kindness2-5")
                        } label: {
                            Image("Kindness2-5").resizable()
                        }
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness2-6")
                        } label: {
                            Image("Kindness2-6").resizable()
                        }
                        NavigationLink{
                            PDFViewView(name: "Kindness2-7")
                        } label: {
                            Image("Kindness2-7").resizable()
                        }
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness2-8")
                        } label: {
                            Image("Kindness2-8").resizable()
                        }
                        NavigationLink{
                            PDFViewView(name: "Kindness2-9")
                        } label: {
                            Image("Kindness2-9").resizable()
                        }
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness2-10")
                        } label: {
                            Image("Kindness2-10").resizable().scaledToFit()
                        }
                        
                    }
                }.padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
        }
    }
}

struct Coloring_Previews: PreviewProvider {
    static var previews: some View {
        Coloring()
    }
}
