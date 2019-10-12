//
//  ContentView.swift
//  Challenge 1
//
//  Created by Felix Lin on 10/11/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = "0"
    @State private var from = 0
    @State private var to = 0
    
    var result: Double {
        let initial = Measurement(value: Double(temperature) ?? 0, unit: Temperature.units[from].unit)
        
        return initial.converted(to: Temperature.units[to].unit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", text: $temperature)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From")) {
                    Picker("From", selection: $from) {
                        ForEach(0 ..< Temperature.units.count) {
                            Text(Temperature.units[$0].text)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")) {
                    Picker("To", selection: $to) {
                        ForEach(0 ..< Temperature.units.count) {
                            Text(Temperature.units[$0].text)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temperature")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
