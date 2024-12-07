import Cocoa

// how to limit access to internal data using access control
//  private: don't let anything outside the struct use this.
//  fileprivate: don't let anything outside the current file use this.
//  public: let anyone, anywhere use this.
//  private(set): let anyone read this property internally or externally, but only let my internal methods write it

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}


// static properties and methods
// sometimes you want to add a property or method to the struct itself, rather than to one particular instance of the struct (which allows you to use them directly); used a lot of creating example data and storing fixed data that needs to be accessed in various places.
struct School {
    nonisolated(unsafe) static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// exists across all School instances (don't need to create a new instance of school)
// i.e., it's the struct itself
School.add(student: "Taylor Swift")
print(School.studentCount)

// if you want to mix and match static and non-static properties and methods
//  you can't access non-static code from static code
//  you can access static code from non-static code, always use your type's name such as School.studentCount -- you can also use Self to refer to the current type of struct that we're on right now
//  again, self refers to the current value of the struct
//    and Self refers to the current type

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.google.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "testing", password: "abc")
}

print(Employee.example.username) // available on the struct for easy organization


// checkpoint 6:
// - create a struct to store information about a car. include:
//   - its model
//   - number of seats
//   - current gear
// - add a method to change gears up or down
// - think about variables and access control
// - don't allow invalid gears - 1...10 seems like a fair maximum range

// first attempt:
//  - reflection: too complicated, could have just used enums; this current version is too prone to counting errors/edge cases
struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var didGearGoUp: Bool = true
    private(set) var currentGear: Int = 1 {
        didSet {
            print("\(oldValue)")
            if oldValue + 1 < 11 && didGearGoUp {
                    print(" - shifting from \(oldValue) gear --> \(oldValue + 1) gear")
                } else if oldValue - 1 > 0 && !didGearGoUp {
                    print(" - shifting from \(oldValue) gear --> \(oldValue - 1) gear")
                } else {
                    print("    - unable to shift -- reached max or min # of gears!!")
                }
        }
    }
    
    static let example = Car(model: "honda accord", numberOfSeats: 4)
    
    func getInfo() {
        print()
        print("your \(model) with \(numberOfSeats) seats is in gear \(currentGear)!")
    }
    
    mutating func shiftGears(up: Bool) {
        if up {
            currentGear += 1
            
            if currentGear > 10 {
                currentGear -= 1
            }
            
            didGearGoUp = true
        } else {
            currentGear -= 1
            
            if currentGear < 1 {
                currentGear += 1
            }
            
            didGearGoUp = false
        }
    }
}

Car.example.getInfo()

var lambo = Car(model: "lambo mercy", numberOfSeats: 2)
lambo.getInfo()

for _ in 1..<11 {
    lambo.shiftGears(up: true)
}

print()

for i in stride(from: 10, to: 0, by: -1) {
    print(i)
    lambo.shiftGears(up: false)
}


// better version based on:
// https://www.hackingwithswift.com/forums/100-days-of-swiftui/checkpoint-6-changing-gears/10129
struct carTwo {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 1
    
    enum GearDirection {
        case up, down, neutral
    }
    
    public mutating func shiftGear(_ direction: GearDirection) {
        switch direction {
        case .up: currentGear += 1
            if currentGear > 10 { currentGear = 10 }
        case .down: currentGear -= 1
            if currentGear < 1 { currentGear = 1 }
        case .neutral:
            currentGear = 1
        }
        
        print("your \(model) is in gear \(currentGear)")
    }
}

var lamboTwo = carTwo(model: "lambo mercy", numberOfSeats: 2, currentGear: 1)

print()

for i in 1...11 {
    lamboTwo.shiftGear(.up)
}

print()

for i in stride(from: 10, to: 0, by: -1) {
    lamboTwo.shiftGear(.down)
}

print()

lamboTwo.shiftGear(.up)
lamboTwo.shiftGear(.up)
lamboTwo.shiftGear(.neutral)
