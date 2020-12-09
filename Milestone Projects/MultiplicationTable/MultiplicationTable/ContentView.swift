//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by Adam Nguyen on 9/2/20.
//  Copyright © 2020 Adam Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isGameActive = false
    @State var questionsList: [Questions] = []
    @State var multiplicationTable = 0
    // QuestionsList and multiplicationTable will go here
    // SettingsView will modify it in it's view and then those two variables will be passed to GameActiveView
    // Generate QuestionsList before passing to GameActiveView

    var body: some View {
        Group {
            if isGameActive {
                // Return GameActiveView swift view
                // State will never reach this part at the moment, need to fix
                GameActiveView(multiplicationTable: 6, numberOfQuestions: 5, questionsList: [Questions(question: "Test", answer: 5)])
            } else {
                // Return Settings swift view
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
