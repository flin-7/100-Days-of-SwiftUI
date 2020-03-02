//
//  ContentView.swift
//  BarChartAnimations
//
//  Created by Felix Lin on 3/2/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var pickerSelectedItem = 0
    @State private var dataPoint: [[CGFloat]] = [
        [50, 100, 150, 30, 40],
        [150, 100, 50, 200, 10],
        [10, 20, 30, 50, 100],
    ]
    
    var body: some View {
        ZStack {
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack(spacing: 16) {
                    BarView(value: dataPoint[pickerSelectedItem][0])
                    BarView(value: dataPoint[pickerSelectedItem][1])
                    BarView(value: dataPoint[pickerSelectedItem][2])
                    BarView(value: dataPoint[pickerSelectedItem][3])
                    BarView(value: dataPoint[pickerSelectedItem][4])
                }
                .padding(.top, 24)
                .animation(.default)
            }
        }
    }
}

struct BarView: View {
    
    var value: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30,height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                Capsule().frame(width: 30,height: value)
                    .foregroundColor(.white)
            }
            Text("D")
                .padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
