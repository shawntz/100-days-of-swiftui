import Cocoa

let team = ["Adam", "Bailey", "Chris", "Dan", "Edward"]

let sorted = team.sorted(by: { (a: String, b: String) -> Bool in
    print(a)
    print(b)
    if a == "Dan" {
        print("true")
        return true
    } else if b == "Dan" {
        print("false")
        return false
    }
    
    return a < b
})

print(sorted)
print("Adam" > "Bailey")

// we don't have to specify the parameters / return types for our closure because .sorted requires a and b to be strings and return a Bool
// trailing closure syntax: don't need (by: ...

let sortedTwo = team.sorted {
    if $0 == "Dan" {
        return true
    } else if $1 == "Dan" {
        return false
    }
    
    return $0 < $1
}

print(sortedTwo)

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

// more examples
// array filter functions

let bOnly = team.filter { $0.hasPrefix("B") }
print(bOnly)

// map function to transfer all items
// you don't need to return the same type with map
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// how to write functions that accept function as parameters
func greetUser() {
    print("Hi there!")
}

greetUser()
var greetCopy: () -> Void = greetUser
greetCopy()

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

// you can also make your function accept multiple functions parameters ie you can specify multiple trailing closures
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("start first")
    first()
    print("start second")
    second()
    print("start third")
    third()
    print("done!")
}

doImportantWork {
    print("this is the first work")
} second: {
    print("this is the second work")
} third: {
    print("this is the third work")
}


// checkpoint 5
// use sorted, filter, and map in a chain without using temporary variables
// input: let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// task: filter out any numbers that are even, then sort the remaining array in ascending order, then map them to strings in the format "7 is a lucky number", and then print the resulting array, one item per line
print()
print("checkpoint 5:")

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let checkpointFive = luckyNumbers.sorted()
    .filter { !$0.isMultiple(of: 2) }
    .map { String($0) + " is a lucky number" }

for luckyNumber in checkpointFive {
    print(luckyNumber)
}

// or

print()

checkpointFive.forEach { print($0) }
