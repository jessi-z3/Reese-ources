//
//  PromptView.swift
//  Reese-ources
//
//  Created by Jessi on 6/11/23.
//

import SwiftUI
import Foundation

struct PromptView: View {
    @State private var selectedPromptText: String? = nil
    @Environment(\.managedObjectContext) var context
    @State private var content: String = ""
    let existingPrompt: Prompt?
    @State private var navigateToSavedPrompts = false
    @State private var isShowingPromptPicker = false
    @State private var searchText = ""
    @State private var saveErrorMessage: String? // Added for displaying save errors
    let promptList: [String] = [
        "1. What can you do to put a stop to the culture of bullying?",
        "2. How can you support your peers who have been bullied in the past?",
        "3. Do you think bullying is more prevalent online or in the classroom? At school or during extracurricular activities?",
        "4. When you see someone being bullied, do you feel comfortable going to a teacher or adult for help? Why or why not?",
        "5. What is the best way to get someone to stop bullying another person? Should you defend the victim? Start a fight? Make fun of the bully? Why or why not?",
        "6. What is the difference between teasing and bullying? How can you tell the difference between them?",
        "7. At what point does teasing become bullying? Does the frequency of the behavior play a role?",
        "8. Have you ever felt bullied by someone? What made you feel this way?",
        "9. Have you ever bullied another person? How did you feel before, during, and after?",
        "10. What is the danger of standing around and watching while someone else is bullied?",
        "11. What kinds of consequences do kids who are bullied suffer?",
        "12. Why is it important to accept people for who they are?",
        "13. Do you think there are particular types of attitudes that contribute to bullying? Are there people who think bullying is acceptable? Why or why not?",
        "14. In what situations do you and your friends see people bullied? Do you ever try to stop someone from getting bullied?",
        "15. How do you feel when someone teases you or gives you a hard time for something you like? Why do you feel this way?",
        "16. Are there any risks to standing up for someone who is being bullied? What are they? How do they impact your decision to get involved in a situation?",
        "17. Have you ever talked to your parents about bullying? What did they say?",
        "18. Write about a time when you stood up for something that you believed in. Was it hard to express an opinion that other people didn’t agree with? Why or why not?",
        "19. Write short one-paragraph stories about four different types of bullying. How do you think the people in each story would feel if the behavior lasted for a week? What if it lasted a month? The entire school year?",
        "20. Why do you think some people bully others?",
        "21. What feeling does the bully get from putting someone else down?",
        "22. Come up with an idea for a new way to increase awareness about bullying. How can you help people understand that bullying is a problem?",
        "23. Are some types of bullying more harmful than others?",
        "24. What would you do if someone tried to bully you?",
        "25. What would you do if you saw someone trying to hurt one of your friends? Would you intervene or get an adult to help? Why?",
        "26. Have you ever wanted to stand up for someone who was being made fun of? Did you intervene? Why or why not?",
        "27. How do you feel when you see someone else being teased?",
        "28. Why do you think people have trouble accepting others who are different from them?",
        "29. Write about a time when you did something nice for someone because you saw that another person had hurt him or her. What did you do? How did the other person feel afterward?",
        "30. How do you think a bullying victim feels when he or she is laughed at, hurt, or degraded?",
        "31. How can you encourage other people to be more accepting of those who are different?"
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Button {
                    isShowingPromptPicker = true
                } label: {
                    HStack {
                        Image(systemName: "list.bullet.rectangle")
                        Text("Choose a Prompt")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.primary)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                }
                .sheet(isPresented: $isShowingPromptPicker) {
                    PromptSelectionView(
                        searchText: $searchText,
                        prompts: promptList,
                        onSelect: { selected in
                            selectedPromptText = selected
                            content = "\(selected)\n\n"
                            isShowingPromptPicker = false
                        }
                    )
                }

                Text("Your Writing")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                HStack {
                    Button("B") {
                        content += "**"
                    }.bold().padding(6).background(Color.white).cornerRadius(6)

                    Button("I") {
                        content += "_"
                    }.italic().padding(6).background(Color.white).cornerRadius(6)

                    Button("Clear") {
                        content = ""
                    }.padding(6).background(Color.red.opacity(0.7)).cornerRadius(6).foregroundColor(.white)
                }
                .padding(.horizontal)

                TextEditor(text: $content)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding(.horizontal)

                HStack {
                    Spacer()
                    Button {
                        do {
                            let promptText = selectedPromptText?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                            let trimmedContent = content.trimmingCharacters(in: .whitespacesAndNewlines)

                            let combinedContent = promptText.isEmpty || trimmedContent.hasPrefix(promptText)
                                ? trimmedContent
                                : "\(promptText)\n\n\(trimmedContent)"

                            let promptToSave = existingPrompt ?? Prompt(context: context)
                            promptToSave.content = combinedContent
                            promptToSave.date = Date()
                            if existingPrompt == nil {
                                promptToSave.id = UUID()
                            }
                            try context.save()

                            print("Saving prompt: \(combinedContent)")
                            if existingPrompt == nil {
                                content = "\(promptText)\n\n"
                            }
                            navigateToSavedPrompts = true
                        } catch {
                            saveErrorMessage = "Failed to save prompt: \(error.localizedDescription)"
                        }
                    } label: {
                        Text("Save")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Writing")
            .background(Color("reeseblue").edgesIgnoringSafeArea(.all))
            .navigationDestination(isPresented: $navigateToSavedPrompts) {
                Prompts().environment(\.managedObjectContext, context)
            }
            .alert("Error", isPresented: .constant(saveErrorMessage != nil)) {
                Button("OK") {
                    saveErrorMessage = nil
                }
            } message: {
                Text(saveErrorMessage ?? "")
            }
            .onAppear {
                if let existingPrompt, content.isEmpty {
                    content = existingPrompt.content ?? ""
                    selectedPromptText = nil
                }
            }
        }
    }
}
struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView(existingPrompt: nil)
    }
}

struct PromptSelectionView: View {
    @Binding var searchText: String
    var prompts: [String]
    var onSelect: (String) -> Void

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search prompts...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding()

                List {
                    ForEach(filteredPrompts, id: \.self) { prompt in
                        Text(prompt)
                            .padding(.vertical, 4)
                            .onTapGesture {
                                onSelect(prompt)
                            }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Select a Prompt")
        }
    }

    private var filteredPrompts: [String] {
        if searchText.isEmpty {
            return prompts
        } else {
            return prompts.filter {
                $0.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
