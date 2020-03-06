//
//  ContentView.swift
//  StackingEssentials
//
//  Created by Felix Lin on 3/6/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(spacing: 12) {
                    Text("LBTA")
                        .padding(.all, 16)
                        .background(Color.purple)
                    Spacer()
                        .frame(height: 5)
                        .background(Color.red)
                }
                
                Spacer()
                    .frame(width: 5)
                    .background(Color.blue)
                
                HStack(spacing: 12) {
                    Spacer()
                        .frame(height: 5)
                        .background(Color.red)
                    Text("LBTA")
                        .padding(.all, 16)
                        .background(Color.purple)
                }
            }
            .background(Color.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
