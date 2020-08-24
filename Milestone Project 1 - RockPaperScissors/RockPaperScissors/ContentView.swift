//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Adam Nguyen on 8/18/20.
//  Copyright © 2020 Adam Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    enum AlertTypes {
        case showScore, showFinalScore
    }
    @State private var choiceIndex: Int = Int.random(in: 0...2)
    @State private var round = 1
    @State private var score = 0
    @State private var showAlert = false
    @State private var showAlertType: AlertTypes = .showScore
    @State private var winOrLose = Bool.random()
    var choices = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        VStack {
            Text("Round \(round)")
            
            Text("Player's Score: \(score)")
            
            Text("App's Move: \(choices[choiceIndex])")
            
            Text("Win or Lose: \(winOrLose ? "Win" : "Lose")")
            
            HStack {
                ForEach(choices, id: \.self) { choice in
                    VStack {
                        Button(action: {
                            if self.result(playerInput: choice) {
                                self.score += 1
                            } else {
                                self.score -= 1
                            }
                            
                            self.checkRound()
                        }) {
                            Text("\(choice)")
                        }
                        .alert(isPresented: self.$showAlert) {
                            switch self.showAlertType {
                                case .showScore:
                                    return Alert(title: Text("Results"), message: Text("You are \(self.result(playerInput: choice) ? "Right" : "Wrong")"), dismissButton: .default(Text("Next Round")))
                                case .showFinalScore:
                                    return Alert(title: Text("Game Over"), message: Text("Final Score: \(self.score)"), dismissButton: .default(Text("New Game")))
                            }
                        }
                    }
                }
            }
        }
    }
    
    func result(playerInput: String) -> Bool {
        var playerOutcome = false
        
        switch choices[choiceIndex] {
            case "Rock":
                if playerInput == "Paper" {
                    playerOutcome = true
                }
            case "Paper":
                if playerInput == "Scissors" {
                    playerOutcome = true
                }
            case "Scissors":
                if playerInput == "Rock" {
                    playerOutcome = true
                }
            default:
                break
        }
        
        if winOrLose == playerOutcome {
            return true
        } else {
            return false
        }
    }
    
    func checkRound() {
        round += 1
        
        if self.round > 10 {
            self.showAlertType = .showFinalScore
            self.showAlert = true
            self.resetGame()
        } else {
            self.showAlertType = .showScore
            self.showAlert = true
            self.randomize()
        }
    }
    
    func resetGame() {
        round = 1
        score = 0
        randomize()
    }
    
    func randomize() {
        choiceIndex = Int.random(in: 0...2)
        winOrLose = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
