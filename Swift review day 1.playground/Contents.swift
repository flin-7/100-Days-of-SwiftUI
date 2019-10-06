import UIKit

/// Variables and constants

var name = "Tim McGraw"
name = "Romeo"

/// Types of Data

var name2: String
name2 = "Tim McGraw"

var age: Int
age = 25

var latitude: Double
latitude = 36.166667

var longitude: Double
longitude = -12345678986.783333

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false

/// Operators

//var a = 10
//a = a + 1
//a = a - 1
//a = a * a
//
//var b = 10
//b += 10
//b -= 10

var a = 1.1
var b = 2.2
var c = a + b

name2 = "Romeo"
name = "Tim McGraw"
var both = name + " and " + name2

c > 3
c >= 3
c > 4
c < 4

name == "Tim McGraw"
name != "TIM McGraw"

stayOutTooLate
!stayOutTooLate

/// String interpolation

"Your name is \(name)"
"Your name is \(name), your age is \(age), and your latitude is \(latitude)."
"Your age is \(age) years old. In another \(age) years you will be \(age * 2)."

/// Arrays

var evenNumbers = [2, 4, 6, 8]
var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December"]

songs[0]
songs[1]
songs[2]

type(of: songs)

var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
songs + songs2

/// Dictionaries

var person = [
    "first": "Taylor",
    "middle": "Alison",
    "last": "Swift",
    "month": "December",
    "website": "taylorswift.com"
]
person["middle"]
person["month"]

/// Conditional statements

var action: String
var person1 = "hater"

if person1 == "hater" {
    action = "hate"
} else if person1 == "player" {
    action = "play"
} else {
    action = "cruise"
}

stayOutTooLate = true
nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}

/// Loops

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str)

for song in songs {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0..<people.count {
    var str = "\(people[i]) gonna"
    
    for _ in 1...5 {
        str += " \(actions[i])"
    }
    
    print(str)
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    
    counter += 1
    
    if counter == 556 {
        break
    }
}

for song in songs {
    if song == "You Belong with Me" {
        continue
    }
    
    print("My favorite song is \(song)")
}

/// Switch case

let liveAlbums = 2

switch liveAlbums {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're a rising star!")
    
case 4...5:
    print("You're world famous!")
    
default:
    print("Have you done something new?")
}
