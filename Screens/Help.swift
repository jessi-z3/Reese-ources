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
        ["There has been a crime or someone is at immediate risk of harm.", "Call 911\nor\nText 911",
        ],
        ["Someone is feeling hopeless, helpless, thinking of suicide.", "Call 911\nor\nText 911",
        ],
        [
          "Someone is acting differently than normal, such as always seeming sad or anxious, struggling to complete tasks, or not being able care for themselves.","Find a local counselor or other mental health services",
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
        ScrollView{
            VStack{
                Text("Find Help").font(.custom("DancingScript-Bold", size: 70)).foregroundColor(.white)
                Text("If you have done everything you can to resolve the situation and nothing has worked, or someone is in immediate danger, there are ways to get help.").font(.custom("Gabriela-Regular", size: 22)).foregroundColor(.white).padding()
              }
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(tableHead, id: \.self){ header in
                    Text(header).font(.custom("Gabriela-Regular", size: 20)).foregroundColor(.accentColor)
                }
                ForEach(tableData, id: \.self){ data in
                    Text(data[0]).font(.custom("Gabriela-Regular", size: 18)).foregroundColor(.accentColor)
                    Text(data[1]).font(.custom("Gabriela-Regular", size: 18)).foregroundColor(.accentColor)
                }
            }.padding().background(Color("reeselightblue"))
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
