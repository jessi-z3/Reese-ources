//
//  Help.swift
//  Reese-ources
//
//  Created by Jessi on 6/8/23.
//

import SwiftUI

struct Help: View {
    let url1 = "tel:911"
    let url2 = "sms:911"


    let tableHead =  ["The Problem", "What you can do"]
    let tableData = [
        ["There has been a crime or someone is at immediate risk of harm.", "Call 911 or Text 911",
        ],
        [
          "Someone is acting differently than normal, such as always seeming sad or anxious, struggling to complete tasks, or not being able care for themselves.","Call or Text 988 for free, 24/7 confidential support from the Suicide & Crisis Lifeline.",
        ],
        [
          "A child is being bullied in school.", "Contact the:\n1. School counselor \n2. School principal\n3. School superintendent\n4. State Department of Education",
        ],
        [
          "The school is not adequately addressing harassment based on race, color, national origin, sex (including sexual orientation and gender identity), disability, or religion.", "Contact:\n- School superintendent\n- State Department of Education\n- U.S. Department of Education, Office for Civil Rights\n- U.S. Department of Justice, Civil Rights Division",
        ],
      ]
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           ]
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Find Help")
                    .font(.custom("DancingScript-Bold", size: 70))
                    .foregroundColor(.white)

                Text("If someone is in danger or you’ve exhausted all options and need help, here are resources you can turn to.")
                    .font(.custom("Gabriela-Regular", size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                VStack(spacing: 15) {
                    VStack(spacing: 5) {
                        Text("Reese Carr (Advocate)")
                            .font(.custom("Gabriela-Regular", size: 20))
                            .foregroundColor(.accentColor)
                        Link("📞 Call Reese", destination: URL(string: "tel:5733008630")!)
                            .font(.custom("Gabriela-Regular", size: 18))
                            .foregroundColor(.blue)
                        Link("💬 Text Reese", destination: URL(string: "sms:5733008630")!)
                            .font(.custom("Gabriela-Regular", size: 18))
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color("reeselightblue"))
                .cornerRadius(12)

                VStack(spacing: 15) {
                    ForEach(tableData, id: \.self) { entry in
                        VStack(alignment: .center, spacing: 8) {
                            Text(entry[0])
                                .font(.custom("Gabriela-Regular", size: 20))
                                .foregroundColor(.accentColor)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)

                            if entry[1].contains("Call 911") || entry[1].contains("Text 911") {
                                VStack(spacing: 5) {
                                    Link("📞 Call 911", destination: URL(string: "tel:911")!)
                                        .font(.custom("Gabriela-Regular", size: 18))
                                        .foregroundColor(.blue)
                                    Link("💬 Text 911", destination: URL(string: "sms:911")!)
                                        .font(.custom("Gabriela-Regular", size: 18))
                                        .foregroundColor(.blue)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            if entry[1].contains("Call 988") || entry[1].contains("Text 988") {
                                VStack(spacing: 5) {
                                    Link("📞 Call 988", destination: URL(string: "tel:988")!)
                                        .font(.custom("Gabriela-Regular", size: 18))
                                        .foregroundColor(.blue)
                                    Link("💬 Text 988", destination: URL(string: "sms:988")!)
                                        .font(.custom("Gabriela-Regular", size: 18))
                                        .foregroundColor(.blue)
                                }
                                .frame(maxWidth: .infinity)
                                Text("Call or Text 988 for free, 24/7 confidential support from the Suicide & Crisis Lifeline.")
                                    .font(.custom("Gabriela-Regular", size: 18))
                                    .foregroundColor(.accentColor)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                            } else {
                                VStack(alignment: .leading, spacing: 4) {
                                    ForEach(entry[1].components(separatedBy: .newlines), id: \.self) { line in
                                        if line.hasPrefix("1.") || line.hasPrefix("2.") || line.hasPrefix("3.") || line.hasPrefix("4.") || line.hasPrefix("-") {
                                            Text(line)
                                                .font(.custom("Gabriela-Regular", size: 18))
                                                .bold()
                                                .foregroundColor(.accentColor)
                                                .multilineTextAlignment(.leading)
                                        } else {
                                            Text(line)
                                                .font(.custom("Gabriela-Regular", size: 18))
                                                .foregroundColor(.accentColor)
                                                .multilineTextAlignment(.center)
                                                .frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("reeselightblue"))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("reeseblue"))
    }
}

struct Help_Previews: PreviewProvider {
    static var previews: some View {
        Help()
    }
}
