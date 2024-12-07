import Cocoa

// arrays in swift
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

//var albums = [String]() // same as line 23

// array length
print(albums.count)

// removing items from array
albums.remove(at: 2)
print(albums.count)
albums.removeAll()
print(albums.count)

// using contains() to check for array membership
let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

// sorting arrays with sorted()
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

// reverse arrays with reversed()
let presidents = ["Bush", "Obama", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

// sorted() and reversed() functions + others also work for strings


// using dictionaries in swift
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

// data might not actually be there - are you sure you want to print it?
print(employee2["name"])
print(employee2["job"])
print(employee2["location"])

// one way to deal with optionals
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// other key-value pair examples
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

// creating an empty dict with explicit type declaration
var heights = [String: Int]() // strings for its keys, and ints for its values
heights["Yao Ming"] = 229
heights["LeBron James"] = 206
heights["Shaq"] = 216

// you can use count() and removeAll() functions for dictionaries just like with arrays
heights.count
heights.removeAll()
heights.count


// using sets in swift
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

var peopletwo = Set<String>()
peopletwo.insert("Denzel Washington")
peopletwo.insert("Tom Cruise")
peopletwo.insert("Nicolas Cage")
peopletwo.insert("Samuel L Jackson")
print(peopletwo)

// how to create and use enums
// they are more efficient and safer to use in your code
// example: user selecting the day of the week
enum Weekday {
    // add all of the possible cases we want to support
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday // you can skip the "Weekday" part because day is of the Weekday datatype and can't be changed later on after init
print(day)


// using type annotations
let surname: String = "Lasso"
var score: Int = 0

// if score was a decimal (b/c half points are possible), then:
var scoretwo: Double = 0

// Knowing all the types is important for times when you don't want to provide
// initial values for the variable (e.g., var teams: [String] = [String]())
//
// String, Int, Double, Bool, Array (e.g., [String] = ["Red", "Fearless"]),
// Dictionary (e.g., [String: String] = ["id": "@test"],
// Set (e.g., Set<String> = Set([...])
//
// For those that prefer to use type annotation to init an empty array:
var citiestwo: [String] = []
// For those who prefer to use type inference as much as possible:
var clues = [String]()
//
//
// Enums are a bit different because they let us create new types of our own
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

// creating constants that don't have a value assigned yet, but will at some point
let username: String
username = "@shawn"
print(username)


// checkpoint 2:
// create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array
var mystrings: [String] = ["This", "is", "my", "string", "isnt", "it", "such", "a", "cool", "string"]
print(mystrings.count)
print(Set(mystrings).count)
