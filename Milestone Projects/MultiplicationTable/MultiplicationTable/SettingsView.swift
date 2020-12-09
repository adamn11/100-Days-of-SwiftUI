//
//  SettingsView.swift
//  MultiplicationTable
//
//  Created by Adam Nguyen on 9/2/20.
//  Copyright © 2020 Adam Nguyen. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State private var multiplicationTable = 1
    @State private var numberOfQuestionsSelection = 0
    let numberOfQuestions = [5, 10, 20]  // TODO: Add "All"
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section (header: Text("Select Multiplication Table from 1 to...")) {
                        Stepper(value: $multiplicationTable, in: 1...12) {
                            Text("\(multiplicationTable)")
                        }
                    }
                    
                    Section (header: Text("How many questions would you like?")) {
                        Picker(selection: $numberOfQuestionsSelection,
                               label: Text("How many questions would you like?")) {
                                ForEach(0..<numberOfQuestions.count) {
                                    Text("\(self.numberOfQuestions[$0])")
                                }
                        }
                        .labelsHidden()
                    }
                }
                
                /*
                TODO: generateQuestions will be called everytime the view is refreshed (when the view is created, when the user
                increments/decrement in stepper, etc). This can cause high CPU usage if generateQuestions was more demanding.
                It would be better to have this only called once, preferrably right after the navigation link is pressed.
                */
                NavigationLink(destination: GameActiveView(multiplicationTable: self.multiplicationTable,
                                                           numberOfQuestions: numberOfQuestions[numberOfQuestionsSelection],
                                                           questionsList: generateQuestions())) {
                    Text("Start Game!")
                }
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: 300)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .font(.title)
            }
            .navigationBarTitle("Settings")
        }
    }
    
    func generateQuestions() -> [Questions] {
        var questionsList: [Questions] = []

        print("Generating Questions")
        for i in 0...numberOfQuestions[numberOfQuestionsSelection] {
            questionsList.append(Questions(question: "\(multiplicationTable) x \(i)", answer: multiplicationTable*i))
        }
        questionsList.shuffle()
        
        return questionsList
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
