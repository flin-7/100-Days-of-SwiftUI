//
//  ContentView.swift
//  WeSplit
//
//  Created by Felix Lin on 10/8/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "4"
    @State private var tipPercentage = 2
    @State private var useRedText = false
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double((Int(numberOfPeople) ?? 1))
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipsSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipsSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percantage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .primary)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
