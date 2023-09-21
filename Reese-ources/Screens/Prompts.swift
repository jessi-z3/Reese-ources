//
//  Prompts.swift
//  Reese-ources
//
//  Created by Jessi on 6/11/23.
//

import SwiftUI
import Foundation

struct Prompts: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id)])
    var prompts: FetchedResults<Prompt>
    func deletePrompt(at offsets: IndexSet) {
        for index in offsets {
            let prompt = prompts[index]
            context.delete(prompt)
        }
        try? context.save()
    }

    var body: some View {
       VStack(alignment: .trailing){
            ScrollView{
                VStack{
                    Text("My Prompts").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white).padding(25)
                    ForEach(prompts.reversed()) { prompt in
                        VStack{
                            Text(prompt.id!.formatted()).font(.custom("Gabriela-Regular", size: 18)).foregroundColor(.white)
                            Spacer()
                            Text(prompt.content!).font(.custom("Gabriela-Regular", size: 24)).foregroundColor(.white)
                            Divider()
                        }
                    }
                    .onDelete(perform: deletePrompt(at: ))
                    .padding(15)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
        }
    }
}

struct Prompts_Previews: PreviewProvider {
    static var previews: some View {
        Prompts()
    }
}
