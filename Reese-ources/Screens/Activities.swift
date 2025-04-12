//
//  Activities.swift
//  Reese-ources
//
//  Created by Jessi on 6/8/23.
//

import SwiftUI

struct Activities: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Activities")
                    .font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white).padding(25)
                Spacer()
                VStack{
                    HStack{
                        NavigationLink{
                            Quiz()
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 160, height: 125)
                                Text("Quiz").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24))
                                
                            }}.padding(5)
                        NavigationLink{
                            Coloring()
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 160, height: 125)
                                Text("Coloring").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24))
                                
                            }}.padding(5)
                        
                    }
                    HStack{
                        NavigationLink{
                            PDFViewView(name: "Kindness-Catcher")
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 160, height: 125)
                                Text("Kindness Catcher").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24)).frame(width: 160, height: 125)
                                
                            }}.padding(5)
                        NavigationLink{
                            Writing()
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 45).fill(Color("reeselightblue")).frame(width: 160, height: 125)
                                Text("Writing Prompts").foregroundColor(Color.accentColor).font(.custom("Gabriela-Regular", size: 24)).frame(width: 160, height: 125)
                                
                            }}.padding(5)
                    }
                    
                }
                Spacer()
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
        }
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities()
    }
}
