//
//  ContentView.swift
//  Milestone 1
//
//  Created by Felix Lin on 10/17/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct GameImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    @State private var moves = ["rock", "paper", "scissors"]
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
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
                
                Text("Game")
                .foregroundColor(.white)
                .font(.title)
                    .fontWeight(.light)
                
                Text("Score: \(score)")
                .foregroundColor(.white)
                .font(.title)
                    .fontWeight(.light)
                
                Spacer()
                
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.newRound()
                })
            }
        }
    }
    
    func buttonTapped(_ number: Int) {
        
        
        showingScore = true
    }
    
    func newRound() {
        randomMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
