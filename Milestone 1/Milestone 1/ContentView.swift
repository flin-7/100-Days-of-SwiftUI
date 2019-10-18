//
//  ContentView.swift
//  Milestone 1
//
//  Created by Felix Lin on 10/17/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var moves = ["rock", "paper", "scissors"]
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 1
    
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                
                VStack(spacing: 30) {
                    
                    VStack(spacing: 10) {
                        
                        Text("I choose \(moves[randomMove])")
                            .titleStyle()
                        
                        Text("You should \(shouldWin ? "win" : "lose")!")
                            .foregroundColor(.white)
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button(action: {
                            self.buttonTapped(number)
                        }) {
                            GameImage(name: self.moves[number])
                        }
                    }
                    
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("\(score)"), dismissButton: .default(Text("Retry?")) {
                        self.newGame()
                        })
                }
                
            }.navigationBarTitle(Text("Round: \(round)/10"), displayMode: .inline)
        }
    }
    
    func buttonTapped(_ number: Int) {
        let result = randomMove - number
        
        switch shouldWin {
        case false:
            if result == 1 || result == -2 {
                score += 1
            } else {
                score -= 1
            }
        case true:
            if result == -1 || result == 2 {
                score += 1
            } else {
                score -= 1
            }
        }
        
        newRound()
        round += 1
        
        if (round == 11) {
            scoreTitle = "Your Final Score:"
            showingScore = true
        }
    }
    
    func newRound() {
        randomMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func newGame() {
        newRound()
        round = 1
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
