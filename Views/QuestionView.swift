//
//  QuestionView.swift
//  MVVM
//
//  Created by Emmanuel Ugwuoke on 15/10/2022.
//

import SwiftUI

struct QuestionView: View {
    
    private let question: String
    private let optionA: String
    private let optionB: String
    private let answer: String
    private var action: (Int) -> Void
    
    @State var selected:String = ""
    
    
    var body: some View {
        
        Text(question).font(.custom("Gabriela-Regular", size: 24)).foregroundColor(Color.white).multilineTextAlignment(.center).frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        ).padding()
        
        Spacer()
        Grid(horizontalSpacing: 20, verticalSpacing: 20){
            GridRow {
                
                AnsButton(optionA, isAccent: true){
                    selected = optionA
                    action(check(optionA))
                }
                AnsButton(optionB){
                    selected = optionB
                    action(check(optionB))
                }
            }
        }
    }
    
    func check(_ option:String) -> Int {
        if option == answer
        {
            return 1
        }
        return 0
    }
    
    init(question: String, optionA: String, optionB: String, answer: String, action: @escaping (Int) -> Void) {
        self.question = question
        self.optionA = optionA
        self.optionB = optionB
        self.answer = answer
        self.action = action
    }
}

