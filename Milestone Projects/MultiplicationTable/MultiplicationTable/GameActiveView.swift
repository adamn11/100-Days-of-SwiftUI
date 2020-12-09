//
//  GameActiveView.swift
//  MultiplicationTable
//
//  Created by Adam Nguyen on 9/2/20.
//  Copyright © 2020 Adam Nguyen. All rights reserved.
//

import SwiftUI

struct GameActiveView: View {
    @State private var randomNumber = Int.random(in: 0...12)
    @State private var score = 0
    @State private var answer = ""
    @State private var showError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var currentQuestion = 0
    @State private var round = 1
    var multiplicationTable: Int
    var numberOfQuestions: Int
    var questionsList: [Questions]

    var body: some View {
        NavigationView {
            VStack {
                TextField("Type your answer here", text: $answer, onCommit: checkAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Score: \(score)")
            }
        }
        .navigationBarTitle("\(questionsList[currentQuestion].question)")
        .alert(isPresented: $showError) {
            Alert(title: Text(errorTitle),
                  message: Text(errorMessage),
                  dismissButton: .default(Text("Continue")))
        }
    }
    
    // TODO: Add some guards to catch if answer is anything else but a number
    func checkAnswer() {
        if Int(answer) == questionsList[currentQuestion].answer {
            score += 1
        }
        else {
            sendAlert(title: "Wrong Answer!", message: "The correct answer is \(questionsList[currentQuestion].answer).")
        }
        
        round += 1

        if round == numberOfQuestions+1 {
            sendAlert(title: "Game Over!", message: "Your Score is \(score)!")
            // TODO: Go back to settings, do this in body somehow
        } else {
            currentQuestion += 1
        }
        
        answer = ""
    }
    
    func sendAlert(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
}

struct GameActiveView_Previews: PreviewProvider {
    static var previews: some View {
        GameActiveView(multiplicationTable: 6, numberOfQuestions: 5, questionsList: [Questions(question: "Test", answer: 5)])
    }
}
