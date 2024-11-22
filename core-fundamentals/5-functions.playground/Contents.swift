import Cocoa

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

print()

func printTimesTablesTwo(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesTwo(number: 5, end: 20)

print()

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

print()

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

let res = areLettersIdentical(string1: "abc", string2: "cab")
print(res)

print()

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

pythagoras(a: 1, b: 2)

// returning multiple values from functions: tuples
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// you can also access the tuple's elements when they aren't named with numerical indices
func getUserTwo() -> (String, String) {
    ("Taylor", "Swift")
}

let userTwo = getUserTwo()
print("Name: \(user.0) \(user.1)")

print()

// pulling out values and assigning them to variables in one line
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// ignoring a particular returned value
let (firstNameTwo, _) = getUser()
print("Name: \(firstNameTwo)")

// to make a function / its parameter names read better, you might want to use different parameter names for iternal/external reference
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

// vs.

func isUppercased(_ string: String) -> Bool {
    string == string.uppercased()
}

let string1 = "HELLO, WORLD"
let res1 = isUppercase(string: string1)

let res2 = isUppercased(string1)

print()

// and you can even specify an external name and internal name (instead of external being blank with _)
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

// how to provide default values for parameters
func printTimesTablesNew(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

print()

printTimesTablesNew(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// graceful error handling in functions
// step 1: tell swift about the possible errors that can happen
enum PasswordError: Error {
    case short, obvious
}

// step 2: writing a function that can flag up errors if they happen
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// step 3: calling that function, and handling any errors that might happen
let string = "12345"

do {
    let result = try checkPassword(string)  // try must always precede functions that can throw errors
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")  // the "Pokemon" catch -- gotta catch 'em all!
}

// try! doesn't require do/catch -- but this is more dangerous
