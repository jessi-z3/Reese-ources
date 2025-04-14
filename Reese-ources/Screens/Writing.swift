//
//  Writing.swift
//  Reese-ources
//
//  Created by Jessi on 6/8/23.
//

import SwiftUI
import Foundation

struct Writing: View {
    @State private var navigateToPrompt = false
    @State private var selectedPrompt: Prompt? = nil

    var body: some View {
        NavigationStack {
            VStack {
                Text("Writing Prompts")
                    .font(.custom("DancingScript-Bold", size: 70))
                    .foregroundColor(.accentColor)
                Spacer()
                
                NavigationLink(destination: PromptView( existingPrompt: nil), isActive: $navigateToPrompt) {
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("reeseblue").ignoresSafeArea())
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        navigateToPrompt = true
                    }) {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.accentColor)
                    }

                    NavigationLink(destination: Prompts()) {
                        Image(systemName: "tray.full.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.accentColor)
                    }
                }
            }
        }
    }
}

struct Writing_Previews: PreviewProvider {
    static var previews: some View {
        Writing()
    }
}
