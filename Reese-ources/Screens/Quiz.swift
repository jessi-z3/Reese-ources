//
//  Quiz.swift
//  Reese-ources
//
//  Created by Jessi on 6/12/23.
//

import SwiftUI
import Foundation


struct QuizQuestion: Codable {
    let question: String
    let optionA: String
    let optionB: String
    let answer: String
}

extension QuizQuestion {
    enum CodingKeys: String, CodingKey {
        case question = "question"
        case optionA = "optionA"
        case optionB = "optionB"
        case answer = "answer"
    }
}

struct QuestionModel: Codable {
    var questions: [QuizQuestion]?
}
struct DataModel: Codable {
    var data: QuestionModel?
}

class QuestionViewModel {
    var questionModel: DataModel?    
    func getAllQuestions(completion: @escaping () -> Void) {
        guard let url = Bundle.main.url(forResource: "QuizQuestions", withExtension: "json") else {
            print("Failed to locate quizquestions.json in bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let finalData = try jsonDecoder.decode(DataModel.self, from: data)
            self.questionModel = finalData
            completion()
        } catch {
            print("Error decoding local JSON: \(error)")
        }
    }
}

    
enum Route: Hashable {
    case landingView
    case scoreView(Int, Int)
    case contentView
}

struct Quiz: View {
    @State private var viewModel = QuestionViewModel()
    @State private var questions: [QuizQuestion]?
    @State private var nextIndex = 0
    @State private var userScore = 0
    
    @State private var showScoreView: String = ""
    
    func next() {
        if nextIndex >= 0 && nextIndex <= questions!.count - 2 {
            nextIndex += 1
        } else {
            showScoreView = "Score"
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if questions?[nextIndex] != nil {
                    let question = questions![nextIndex]
                    
                    QuestionView(question: question.question, optionA: question.optionA, optionB: question.optionB, answer: question.answer) {
                        score in userScore += score
                        next()
                    }
                }
                Spacer()
                
            }
            .toolbar() {
                if (!showScoreView.isEmpty) {
                    ToolbarItem(placement: .cancellationAction) {
                        NavigationLink("Score", destination: ScoreView(score: userScore, total: questions!.count)).buttonStyle(UtilButtonStyle())
                    }
                } else {
                    ToolbarItem(placement: .cancellationAction) {
                        UtilButton("Exit", goBack: true)
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    UtilButton("Next") {
                        next()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("reeseblue"))
            .onAppear {
                viewModel.getAllQuestions(completion: {
                    let questionData = viewModel.questionModel
                    
                    if let data = questionData {
                        if let qs = data.data {
                            questions = qs.questions
                        }
                    }
                })
            }
        }
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
}
