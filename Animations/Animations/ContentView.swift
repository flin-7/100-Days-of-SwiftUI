//
//  ContentView.swift
//  Animations
//
//  Created by Felix Lin on 10/24/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount2: CGFloat = 1
    @State private var animationAmount = 0.0
    
    
    var body: some View {
        VStack(spacing: 72) {
            
            Button("Tap Me") {
                self.animationAmount2 += 1
            }
            .padding(50)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount2)
            .blur(radius: (animationAmount2 - 1) * 3)
            .animation(.default)
            
            Button("Tap Me") {
                //            self.animationAmount += 1
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animationAmount += 360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
            
            Button("Tap Me") {
                //                self.animationAmount2 += 1
            }
            .padding(50)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.blue)
                    .scaleEffect(animationAmount2)
                    .opacity(Double(2 - animationAmount2))
                    .animation(
                        Animation.easeOut(duration: 1)
                            .repeatForever(autoreverses: false)
                )
            )
                .onAppear {
                    self.animationAmount2 = 2
            }
            
        }
        
        //        .overlay(
        //            Circle()
        //                .stroke(Color.red)
        //                .scaleEffect(animationAmount)
        //                .opacity(Double(2 - animationAmount))
        //                .animation(
        //                    Animation.easeIn(duration: 1)
        //                        .repeatForever(autoreverses: true)
        //            )
        //        )
        //            .onAppear {
        //                self.animationAmount = 2
        //        }
        //        print(animationAmount)
        //
        //        return VStack {
        //
        //            Stepper("Scale amount", value: $animationAmount.animation(
        //                Animation.easeOut(duration: 1)
        //                .repeatCount(3, autoreverses: true)
        //            ), in: 1...10)
        //
        //            Spacer()
        //
        //            Button("Tap Me") {
        //                self.animationAmount += 1
        //            }
        //            .padding(40)
        //            .background(Color.red)
        //            .foregroundColor(.white)
        //            .clipShape(Circle())
        //            .scaleEffect(animationAmount)
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
