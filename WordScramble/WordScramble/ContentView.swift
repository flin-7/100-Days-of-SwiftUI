//
//  ContentView.swift
//  WordScramble
//
//  Created by Felix Lin on 3/9/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let word = "Swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
