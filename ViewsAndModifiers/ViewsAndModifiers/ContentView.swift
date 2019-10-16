//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Felix Lin on 10/15/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView: View {
    @State private var usedRedText = false
    
    //    let motto1 = Text("Draco dormiens")
    var motto1: some View { Text("Draco dormiens") }
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        //        Text("Hello World")
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(Color.red)
        //            .edgesIgnoringSafeArea(.all)
        //        Button("Hello World") {
        //            print(type(of: self.body))
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(Color.red)
        //                Text("Hello World")
        //                    .padding()
        //                    .background(Color.red)
        //                    .padding()
        //                    .background(Color.blue)
        //                    .padding()
        //                    .background(Color.green)
        //                    .padding()
        //                    .background(Color.yellow)
        //        Button("Hello World") {
        //            self.usedRedText.toggle()
        //        }
        //        .foregroundColor(usedRedText ? .red : .blue)
        //
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
                    .padding()
                    .background(Color.green)
                    .padding()
                    .background(Color.yellow)
                //                    .blur(radius: 0)
                Text("Hufflepuff")
                    .foregroundColor(.blue)
                Text("Ravenclaw")
                    .background(Color.purple)
                    .blur(radius: 5)
                Text("Slytherin")
                    .titleStyle()
            }
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .watermarked(with: "Hacking with Swift")
        }
        
        
        //            .blur(radius: 5)
        
        //        VStack {
        //            motto1
        //                .foregroundColor(.red)
        //            motto2
        //                .foregroundColor(.blue)
        //        }
        //        VStack(spacing: 10) {
        //            CapsuleText(text: "First")
        //                .foregroundColor(.white)
        //            CapsuleText(text: "Second")
        //                .foregroundColor(.yellow)
        //        }
        
        //        Text("Hello World")
        //            .titleStyle()
        
        //        Color.blue
        //            .frame(width: 300, height: 300)
        //            .watermarked(with: "Hacking with Swift")
        
        //        GridStack(rows: 4, columns: 4) { row, col in
        //            Image(systemName: "\(row * 4 + col).circle")
        //            Text("R\(row) C\(col)")
        //        }
        
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
