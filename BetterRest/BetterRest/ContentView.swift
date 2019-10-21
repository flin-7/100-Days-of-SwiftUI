//
//  ContentView.swift
//  BetterRest
//
//  Created by Felix Lin on 10/18/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    var calculateBedtime: String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        var message: String
        
        do {
            let predicition = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - predicition.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            message = formatter.string(from: sleepTime)
        } catch {
            message = "Sorry, there was a problem calculating your bedtime."
        }
        
        return message
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker(selection: $coffeeAmount, label: Text("Daily coffee intake")) {
                        ForEach(1 ..< 21) {
                            if $0 == 1 {
                                Text("\($0) cup")
                            } else {
                                Text("\($0) cups")
                            }
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("Your ideal bedtime is...")) {
                    Text(calculateBedtime)
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
            }
            .navigationBarTitle("BetterRest")
        }
        
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
