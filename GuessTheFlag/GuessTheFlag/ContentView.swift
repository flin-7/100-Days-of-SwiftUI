//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Felix Lin on 10/12/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var flagRotations: [Double] = [0.0, 0.0, 0.0]
    @State private var flagOpacity: [Double] = [1.0, 1.0, 1.0]
    @State private var flagBlur: [CGFloat] = [0, 0, 0]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(name: self.countries[number])
                    }
                    .rotation3DEffect(.radians(self.flagRotations[number]), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.flagOpacity[number])
                    .blur(radius: self.flagBlur[number])
                    .animation(.default)
                }
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                    })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            correctAnimation()
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number].uppercased())"
            score -= 1
            wrongAnimation()
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        flagRotations = [0.0, 0.0, 0.0]
        flagOpacity = [1.0, 1.0, 1.0]
        flagBlur = [0, 0, 0]
    }
    
    func correctAnimation() {
        for flag in 0...2 {
            if flag == correctAnswer {
                flagRotations[flag] = 360.0
            } else {
                flagOpacity[flag] = 0.25
            }
        }
    }
    
    func wrongAnimation() {
        for flag in 0...2 {
            if flag != correctAnswer {
                flagBlur[flag] = 9
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
