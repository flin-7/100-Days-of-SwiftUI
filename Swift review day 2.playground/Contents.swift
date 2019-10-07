import UIKit

/// Functions

func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

favoriteAlbum(name: "Fearless")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)

func countLettersInString(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLettersInString(in: "Hello")

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    return false
}

if albumIsTaylor(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

if albumIsTaylor(name: "The White Album") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

/// Optionals

//
//var status = getHaterStatus(weather: "rainy")
//
//if let unwrappedStatus = status {
//
//} else {
//
//}
//
//func takeHaterAction(status: String) {
//    if status == "Hate" {
//        print("Hating")
//    }
//}
//
//if let haterStatus = getHaterStatus(weather: "rainy") {
//    takeHaterAction(status: haterStatus)
//}

//var items = ["James", "John", "Sally"]
//
//func position(of string: String, in array: [String]) -> Int {
//    for i in 0..<array.count {
//        if array[i] == string {
//            return i
//        }
//    }
//
//    return 0
//}
//
//let jamesPosition = position(of: "James", in: items)
//let johnPosition = position(of: "John", in: items)
//let SallyPosition = position(of: "Sally", in: items)
//let bobPosition = position(of: "Bob", in: items)


func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

var year = yearAlbumReleased(name: "Taylor Swift")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}

var name: String = "Paul"
var name2: String? = "Bob"
var name3: String! = "Sophie"

/// Optional chaining

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

//let album = albumReleased(year: 2006)?.uppercased()
//print("The album is \(album)")

let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")

///Enumerations

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    default:
        return "😕"
    }
}

getHaterStatus(weather: .cloud)

/// Structs

//struct Person {
//    var clothes: String
//    var shoes: String
//
//    func describe() {
//        print("I like wearing \(clothes) with \(shoes)")
//    }
//}
//
//let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
//let other = Person(clothes: "short skirts", shoes: "high heels")
//
//print(taylor.clothes)
//print(other.shoes)
//
//var taylorCopy = taylor
//taylorCopy.shoes = "flip flops"
//
//print(taylor)
//print(taylorCopy)

/// Classes

class Person {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guiters, and liquor")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrrr rargh rargh rarrrrgh!")
    }
}

var taylor = CountrySinger(name: "Taylor", age: 25)
taylor.name
taylor.age
taylor.sing()

