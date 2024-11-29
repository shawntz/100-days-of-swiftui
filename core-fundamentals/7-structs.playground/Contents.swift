import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
red.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int = 14
    
    // methods
    // must have "mutating" key word preceding "func", otherwise vacationRemaining -= days can't run (because everything within this data structure becomes constant if instance is initialized as a let
    // but with mutating, now instances of Employee can only be initialized with "var"
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! Not enough days remaining.")
        }
    }
}

var archer = Employee(name: "test", vacationRemaining: 14)
archer.takeVacation(days: 5)

var another = Employee(name: "hi", vacationRemaining: 3)
another.takeVacation(days: 5)

var yetagain = Employee(name: "testing")
yetagain.takeVacation(days: 1)


// computing property values dynamically
struct EmployeeTwo {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var shawn = EmployeeTwo(name: "shawn", vacationAllocated: 14)
shawn.vacationTaken += 4
print(shawn.vacationRemaining)
shawn.vacationRemaining = 25
print(shawn.vacationRemaining)
print(shawn.vacationAllocated)


// taking action when a property changes (with "property observers")
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
            print()
        }
    }
}

print()
var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


// creating custom initializers
// you must ensure every property inside your struct has an initial value by the time the initializer finishes
struct Player {
    let name: String
    let number: Int
}

// this is called the "member-wise" initializer because swift accepts each property as it was defined in the struct b/c swift silently creates the initializer for us here
let player = Player(name: "Megan R", number: 15)


struct PlayerCustom {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let playerNew = PlayerCustom(name: "Megan R")
print(playerNew.number)
