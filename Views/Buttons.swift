//
//  Buttons.swift
//  MVVM
//
//  Created by Emmanuel Ugwuoke on 15/10/2022.
//

import SwiftUI




// Answer Button

struct AnsButton: View {
    private var isAccent:Bool = false
    private var text:String = ""
    private var action: () -> Void
    
    var body: some View {
        if isAccent {
            Button(text, action: action).buttonStyle(AccentButton())
        } else {
            
            Button(text, action: action).buttonStyle(DefaultButton())
        }
        
        
    }
    
    
    
    init(_ text: String, isAccent:Bool=false, action: @escaping () -> Void) {
        self.text = text
        self.isAccent = isAccent
        self.action = action
    }
    
    
}

struct AccentButton: ButtonStyle {
    func makeBody(configuration:Configuration) -> some View {
        
        configuration.label.font(.custom("Gabriela-Regular", size: 18)).foregroundColor(Color.accentColor).frame(width: 100, height: 30).background(Color("reeselightblue")).cornerRadius(9).padding(5).shadow(radius: 10).scaleEffect(configuration.isPressed ? 0.9 : 1.0).animation(.easeOut(duration: 0.4), value: configuration.isPressed)
    }
}

struct DefaultButton: ButtonStyle {
    
    func makeBody(configuration:Configuration) -> some View {
        
        configuration.label.font(.custom("Gabriela-Regular", size: 18)).foregroundColor(Color.accentColor).frame(width: 100, height: 30).background(Color("reeselightblue")).cornerRadius(9).padding(5).shadow(radius: 10).scaleEffect(configuration.isPressed ? 0.9 : 1.0).animation(.easeOut(duration: 0.4), value: configuration.isPressed)
    }
}

// Utility Button

struct UtilButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.font(.custom("Gabriela-Regular", size: 18)).foregroundColor(Color.accentColor).frame(width: 100, height: 30, alignment: .center).background(Color("reeselightblue")).cornerRadius(9).padding(30)
    }
}

struct UtilButton: View {
    private var text:String = ""
    private var action: () -> Void
    private var goBack:Bool
    
    var body: some View {
        if goBack {
            
            NavigationLink(text, value: Route.landingView).buttonStyle(UtilButtonStyle())
        }else {
            Button(text, action: action).buttonStyle(UtilButtonStyle())
            
        }}
    
    init(_ text:String, goBack:Bool = false){
        self.text = text
        self.goBack = goBack
        self.action = {}
        
    }
    
    init(_ text:String, action:@escaping () -> Void){
        
        self.text = text
        self.action = action
        self.goBack = false
        
    }
    
    
}

