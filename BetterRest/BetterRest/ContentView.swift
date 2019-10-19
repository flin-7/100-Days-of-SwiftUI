//
//  ContentView.swift
//  BetterRest
//
//  Created by Felix Lin on 10/18/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        //        let now = Date()
        //        let tomorrow = Date().addingTimeInterval(86400)
        //        let range = now ... tomorrow
        //        var components = DateComponents()
        //        components.hour = 8
        //        components.minute = 0
        //        let date = Calendar.current.date(from: components) ?? Date()
        //        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        //        let dateString = formatter.string(from: Date())
        
        //        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
        
        NavigationView {
            
            VStack(spacing: 20) {
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Form {
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
