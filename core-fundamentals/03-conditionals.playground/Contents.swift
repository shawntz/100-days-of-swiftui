import Cocoa

let score = 85

if score > 85 {
    print("Great job!")
}

// comparison operators work on strings out of the box
let ourName = "Dave"
let friendName = "Arnold"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// example: if adding a number to an array makes it contain more than 3 items, remove the oldest one
var numbers = [1, 2, 3]

numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

// methods for checking empty strings:
var username = "shawn"

if username == "" {
    username = "Anon"
}

if username.count == 0 {
    username = "Anon"
}

print("Welcome, \(username)!")

// comparing strings against each other, as well as with integer comparison, is slow in swift because swift supports every language/emojis out of the box. hence, it's better to use the isEmpty functionality
if username.isEmpty == true {
    username = "Anon"
}

// or more simply

if username.isEmpty {
    username = "Anon"
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

// checks to run:
let transport = TransportOption.airplane

// If we are going somewhere by airplane or by helicopter, we’ll print “Let’s fly!”
if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
}
// If we’re going by bicycle, we’ll print “I hope there’s a bike path…”
else if transport == .bicycle {
    print("I hope there's a bike path...")
}
// If we’re going by car, we’ll print “Time to get stuck in traffic.”
else if transport == .car {
    print("Time to get stuck in traffic.")
}
// Otherwise we’ll print “I’m going to hire a scooter now!”
else {
    print("I'm going to hire a scooter now!")
}

// switches
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

// instead of using if, else if, and else...
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

// setting default values if all cases have failed to match
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

// "Second, if you explicitly want Swift to carry on executing subsequent cases, use fallthrough. This is not commonly used, but sometimes – just sometimes – it can help you avoid repeating work.
// For example, there’s a famous Christmas song called The Twelve Days of Christmas, and as the song goes on more and more gifts are heaped on an unfortunate person who by about day six has a rather full house.
// We could make a simple approximation of this song using fallthrough. First, here’s how the code would look without fallthrough:"
let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 french hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// using the ternary conditional operator for quick tests
// WTF" -> "what, true, false"
let age = 18
let canVote = age >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

// example reading the count of an array as part of its condition, then sends back one of two strings
let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

// example that is a bit harder to read
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

