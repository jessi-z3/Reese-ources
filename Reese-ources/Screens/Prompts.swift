//
//  Prompts.swift
//  Reese-ources
//
//  Created by Jessi on 6/11/23.
//

import SwiftUI
import Foundation

extension Date {
    func timeAgoFormatted() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

struct PromptCard: View {
    var prompt: Prompt
    var onDelete: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(prompt.date?.timeAgoFormatted() ?? "Unknown date")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(prompt.content?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                .lineLimit(3)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.vertical, 4)
        .swipeActions {
            Button(role: .destructive, action: onDelete) {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

struct PromptDetailView: View {
    var prompt: Prompt

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(prompt.date?.formatted(date: .abbreviated, time: .shortened) ?? "Unknown date")
                .font(.caption)
                .foregroundColor(.secondary)

            ScrollView {
                Text(prompt.content ?? "")
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Prompt")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("reeseblue").edgesIgnoringSafeArea(.all))
    }
}

struct Prompts: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    var prompts: FetchedResults<Prompt>
    @State private var searchText = ""
    @State private var sortNewestFirst = true
    @State private var showNewPrompt = false
    @State private var selectedPrompt: Prompt? = nil

    func deletePrompt(at offsets: IndexSet) {
        for index in offsets {
            let prompt = prompts[index]
            context.delete(prompt)
        }
        try? context.save()
    }

    var filteredPrompts: [Prompt] {
        let base = Array(prompts)
        let filtered = searchText.isEmpty ? base : base.filter { $0.content?.localizedCaseInsensitiveContains(searchText) ?? false }

        let sorted = filtered.sorted {
            guard let date1 = $0.date, let date2 = $1.date else { return sortNewestFirst }
            return sortNewestFirst ? date1 > date2 : date1 < date2
        }
        return sorted
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Picker("Sort", selection: $sortNewestFirst) {
                    Text("Newest First").tag(true)
                    Text("Oldest First").tag(false)
                }
                .pickerStyle(.segmented)
                .padding()
                
                if filteredPrompts.isEmpty {
                    VStack(alignment: .center) {
                        Spacer()
                        Text("You haven’t saved any prompts yet.")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        Text("Tap the pencil button to create your first writing prompt.")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                        Button {
                            showNewPrompt = true
                        } label: {
                            Label("Create Your First Prompt", systemImage: "square.and.pencil.circle.fill")
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(filteredPrompts, id: \.self) { prompt in
                            PromptCard(prompt: prompt) {
                                if let index = prompts.firstIndex(of: prompt) {
                                    deletePrompt(at: IndexSet(integer: index))
                                }
                            }
                            .onTapGesture {
                                selectedPrompt = prompt
                            }
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                }
            }
            .navigationTitle("My Prompts")
            .background(Color("reeseblue").edgesIgnoringSafeArea(.all))
            
            NavigationLink(
                destination: Group {
                    if let selectedPrompt {
                        PromptDetailView(prompt: selectedPrompt)
                    }
                },
                isActive: Binding(
                    get: { selectedPrompt != nil },
                    set: { if !$0 { selectedPrompt = nil } }
                )
            ) {
                EmptyView()
            }
            
            NavigationLink(destination: PromptView(existingPrompt: nil), isActive: $showNewPrompt) {
                EmptyView()
            }
        }
    }
}

struct Prompts_Previews: PreviewProvider {
    static var previews: some View {
        Prompts()
    }
}
