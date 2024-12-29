import Cocoa

var greeting = "Hello, playground"

// how to handle missing data with optionals
let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposites = opposites["Peach"]

// how to unwrap optionals
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username: String? = nil  // it's simply nothing

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}


var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    // Run if number has a value inside
    print(square(number: number))
}


// how to unwrap optionals with guard
// useful for validation checks / early returns
//  * swift requires you to use return if a guard check fails to bail out of the function completely
//  * if the optional you're unwrapping has a value, you can use it after the guard code finishes
func printSquare(of number: Int?) {
    // Run if number doesn't have a value inside

    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}



// how to unwrap optionals with nil coalescing
// if empty or nil, it will provide a default value instead
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"  // it will not be an optional string anymore

// note: with a dictionary, you can specify a default value, like:
//  let new = captains["Serenity", default: "N/A"]

// example with arrays instead of dict
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)



// how to handle multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"  // if the optional has a value then run another function on it, otherwise, it silently does nothing if the optional was empty
print("Next in line: \(chosen)")

struct Book2 {
    let title: String
    let author2: String?
}

var book2: Book2? = nil
let author2 = book2?.author2?.first?.uppercased() ?? "A"
print(author2)



// how to handle function failure with optionals
// with optional try: i.e., try?
// if at any point the function fails, it will return nil
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

// only use try? if we don't care about the error type that is thrown inside the function
// if you want to do that, use a regular try
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// you can also combine try? with nil coalescing
// i.e., return this value if the function fails at any point
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// try? is mainly used in 3 places:
//  1. in combination with guard let to exit the current function/the current scope if the optional try call fails
//  2. in combination with nil coalescing to attempt something (or provide a default value upon error)
//  3. when calling any throwing function without a return value where you don't care if it worked or not (e.g., writing a log file, sending analytics to a server)



// Checkpoint 9
//  * Write a function that accepts an optional array of integers, and returns one of those integers randomly.
//  * If the array is missing or empty, return a random number in the range 1 through 100.
//  * Write this function in a single line of code.

// less efficient solution
func randomInt(arr: [Int]?) -> Int {
    let randomDraw = (arr?.randomElement()) ?? Array(1...100).randomElement()
    return randomDraw!
}

// better solution:
//  1. force-unwrapping with ! in the return is unnecessary
//  2. Array(1...100) is inefficient because it will create a new array every time the function is called
func randomIntBetter(arr: [Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1...100)
}

print(randomInt(arr: nil))
print(randomInt(arr: [5,1,2]))

print()

print(randomIntBetter(arr: nil))
print(randomIntBetter(arr: [5,1,2]))
