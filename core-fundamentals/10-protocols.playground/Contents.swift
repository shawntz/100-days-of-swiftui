import Cocoa

// note: no function bodies allowed
protocol Vehicle {
    var name: String { get }  // name must be read
    var currentPassengers: Int { get set }  // currentPassengers must be read / write
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric {
    
}

// struct car conforms to vehicle (protocol)
// i.e., car must have the functions as specified in the vehicle protocol
struct Car: Vehicle, CanBeElectric {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

// commute can now be called on any type of Vehicle without needing to change the body of the commute function
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)


// MARK: how to use opaque return types
// the very first swiftui project you'll see in xcode uses opaque return types
//
// original functions
//func getRandomNumber() -> Int {
//    Int.random(in: 1...6)
//}
//
//func getRandomBool() -> Bool {
//    Bool.random()
//}
//
// upgraded functions with opaque return types
func getRandomNumber() -> some Equatable {  // it will be some specific type of Equatable (i.e., an int)
    Int.random(in: 1...6)
    
    // so now if we instead changed Int.random(...) to Double.random(...) later on, the code will still work instead of needing to explicitly change all return types to Double
    // critically, the "some" keyword is what helps keep your code exact (e.g., if we were to just return the Vehicle protocol, it can technically return any Vehicle but Swift won't know exactly what type of Vehicle to return; however, with "some", swift will know exactly what type of Vehicle should be returned...)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

let num = getRandomNumber()
num

// both functions conform to the Equatable protocol in swift, which is why allows us to use the == operator between them like,
print(getRandomNumber() == getRandomNumber())
print(getRandomBool() == getRandomBool())

// you can return different types of Vehicles (ie return the appropriate protocol without needing to write multiple functions for different vehicle types)
// example: query user to indicate how many passengers and how much luggage they have, which will then return the appropriate Vehicle struct for the values they've provided using only 1 function that's generic for any type of vehicle

// MARK: how to create and use extensions
// allow us to add functionality to any type
var quote = "    The truth is rarely pure and never simple    "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmedTwo = quote.trimmed()

quote.trim()
print(quote)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
Book(title: "Test", pageCount: 123)


// MARK: how to create and use protocol extensions
let guests = ["Mario", "Luigi", "Peach"]

extension Collection { // changing it from Array -> Collection allow it to work on any type of collection like arrays, sets, dictionaries, etc.
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

// more readable than ^^
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


// MARK: POP -> protocol oriented programming
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {  // this is now the default implementation of sayHello
        print("Hi, I'm \(name).")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


// MARK: checkpoint 8
// - make a protocol that describes a building
// - your protocol should require the following:
// -- a property storing how many rooms it has
// -- a property storing the cost as an integer
// -- a property storing the name of the estate agent selling the building
// -- a method for printing the sale summary of the building
// - create two structs, `House` and `Office`, that conform to it

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    var buildingType: String { get }
    func summary()
}

extension Building {
    func summary() {
        print("Sales Summary: A \(rooms) room \(buildingType) sold by agent \(agent) for $\(cost).")
    }
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let agent: String
    let buildingType: String
}

print()

let house = House(rooms: 5, cost: 111_222_333, agent: "some agent", buildingType: "home")
house.summary()

struct Office: Building {
    let rooms: Int
    let cost: Int
    let agent: String
    let buildingType: String
}

let office = Office(rooms: 200, cost: 100_000_000_000, agent: "another agent", buildingType: "office")
office.summary()
