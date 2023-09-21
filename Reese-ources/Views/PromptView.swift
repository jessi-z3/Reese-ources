//
//  PromptView.swift
//  Reese-ources
//
//  Created by Jessi on 6/11/23.
//

import SwiftUI
import Foundation


struct PromptView: View {
    @Environment(\.managedObjectContext) var context
    @State private var content = ""

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("New Prompt").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white).padding(25)
                    TextField("Enter your writing prompt here...", text: $content, axis: .vertical)
                        .font(.custom("Gabriela-Regular", size: 22)).foregroundColor(.accentColor).padding(5)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
            .toolbar{
                NavigationLink{
                    Prompts()
                }label: {
                    Image(systemName: "folder.fill").resizable().scaledToFit().foregroundColor(.accentColor).frame(width: 35, height: 35)
                }.accessibilityLabel("View Saved")
                Button{
                    let newPrompt = Prompt(context: context)
                    newPrompt.content = content
                    newPrompt.id = Date()
                    try? context.save()
                    content = ""
                }label: {
                    Image(systemName: "checkmark.circle.fill").resizable().scaledToFit().foregroundColor(.accentColor).frame(width: 35, height: 35)
                }.accessibilityLabel("Save")
            }
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
    }
}
