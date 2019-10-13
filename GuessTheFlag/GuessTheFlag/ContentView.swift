//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Felix Lin on 10/12/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) { () -> Alert in
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
