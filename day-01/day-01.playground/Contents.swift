import Cocoa

var greeting = "Hello, playground"

var name = "Shawn"
name = "Tyler"

let character = "Chris"

var playerName = "Roy"
print(playerName)

let movie = """
A day in
the life of an
Apple engineer
"""

// length of a string
print(name.count)

// string manipulation
print(greeting.uppercased())

// hasPrefix()
print(movie.hasPrefix("A day in"))

// ints
let score = 10
let reallyBig = 100_000_000

var counter = 10
counter += 5
print(counter)

counter *= 10
print(counter)

// tricks
print(counter.isMultiple(of: 2))
print(120.isMultiple(of: 3))

// working floating point numbers
let number = 0.1 + 0.2 // not exactly 0.3 but instead an approximation
print(number)

// type safety
let a = 1
let b = 2.0
let c = Double(a) + b
print(c)

var rating = 5.0
rating *= 2
print(rating)
