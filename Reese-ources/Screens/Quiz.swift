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
    @Environment(\.dismiss) var dismiss
    @AppStorage("highScore") private var highScore: Int = 0
    @State private var viewModel = QuestionViewModel()
    @State private var questions: [QuizQuestion]?
    @State private var nextIndex = 0
    @State private var userScore = 0
    @State private var showScoreView: String = ""
    @State private var path = NavigationPath()
    
    @State private var answerFeedback: String? = nil
    @State private var answerColor: Color = .clear
    @State private var scoreScale: CGFloat = 1.0
    
    func next() {
        if nextIndex >= 0 && nextIndex <= questions!.count - 2 {
            nextIndex += 1
        } else {
            if userScore > highScore {
                highScore = userScore
            }
            showScoreView = "Score"
        }
    }

    func answerSelected(isCorrect: Bool) {
        if isCorrect {
            answerFeedback = "Correct!"
            answerColor = .green
            userScore += 1
        } else {
            answerFeedback = "Wrong!"
            answerColor = .red
        }
        
        // Animate score section pop
        withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.25)) {
            scoreScale = 1.2
        }
        
        // Reset animation and move to next question after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            answerFeedback = nil
            answerColor = .clear
            next()
            
            withAnimation {
                scoreScale = 1.0
            }
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if questions?[nextIndex] != nil {
                    let question = questions![nextIndex]
                    
                    QuestionView(question: question.question, optionA: question.optionA, optionB: question.optionB, answer: question.answer) { score in
                        answerSelected(isCorrect: score > 0)
                    }
                }
                Spacer()
                
                // Answer feedback animation
                if let feedback = answerFeedback {
                    Text(feedback)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(answerColor)
                        .cornerRadius(10)
                        .transition(.opacity)
                        .animation(.easeInOut)
                }
            }
            .toolbar {
                if (!showScoreView.isEmpty) {
                    ToolbarItem(placement: .cancellationAction) {
                        NavigationLink("Score", destination: ScoreView(score: userScore, total: questions!.count)).buttonStyle(UtilButtonStyle())
                    }
                } else {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Exit")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    if let total = questions?.count {
                        Text("Score: \(userScore)/\(total) | High: \(highScore)")
                            .fontWeight(.semibold)
                            .foregroundColor(.black) // Black text color
                            .padding() // Add padding to make the background more visible
                            .background(Color.white) // White background
                            .cornerRadius(10) // Rounded corners for the background
                            .scaleEffect(scoreScale) // Scale effect for score pop
                            .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.25))
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
