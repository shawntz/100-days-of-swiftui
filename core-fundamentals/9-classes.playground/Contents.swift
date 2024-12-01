import Cocoa

// creating your own classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// inheritance
// note: if your parent class has a work() method that takes no parameters, but the child class has a work() method that accepts a string to designate where the work is being done, that doesn't require the "override" keyword because you aren't replacing the parent method
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

// note: the "final" keyword indicates no further inheritance from these child methods is allowed
// tip: good to use until you know you'll need to inherit (i.e., make things final by default)
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours arguing about whether code should be intended using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

var newEmployee = Employee(hours: 5)
var newDeveloper = Developer(hours: 10)
var newManager = Manager(hours: 1)

newDeveloper.work()
newDeveloper.printSummary()
newManager.work()
newManager.printSummary()


// adding class initializers
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)


// how to copy classes
// - all copies of a class instance share the same data (i.e., any changes you make to one copy will automatically change the other copies)
// - this happens because classes are reference types in swift, meaning all copies of a class all refer back to the same underlying data pool
class User {
    var username = "Anonymous"
}

// although the "User" class only has one property, the data will be shared across all copies of this class
var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

// ^^ this behavior allows us to share common data across all parts of our app; swiftui relies heavily on classes for data (esp. given this shared data behavior)

// however, this wouldn't have happened if User was a struct instead of a class

// deep copy approach: if you wanted to create a unique copy of a class instance, you can implement a deep copy method within the class to ensure data are safely copied
class UserTwo {
    var username = "Anon"
    
    func copy() -> UserTwo {
        let user = UserTwo()
        user.username = username
        return user
    }
}

var user3 = UserTwo()
var user4 = user3.copy()
user4.username = "Taylor"
print(user3.username)
print(user4.username)


// creating a deinitializer for a class
// - don't use "func" with deinits
// - deinits never take params or return data (so you don't write them with parens)
// - deinit will automatically be called when the final copy of a class instance is destroyed
// - deinits aren't ever called directly but are instead handled automatically by the system
// - structs don't have deinits because you can't copy them

// scope controls when your deinits are called
// - unlike structs where content created within the {} (scope) is destroyed when a value exits scope, classes -- due to their ability to be copied -- mean only one copy of the underlying data are going away (and as such, there might still be other copies elsewhere)
// - yet, when the final copy goes away (i.e., when the last constant or variable pointing at a class instance is destroyed) then the underlying data is also destroyed, and thus the memory it was using is then returned back to the system

// demonstration
class Student {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print(" * User \(id): created")
    }
    
    deinit {
        print(" * User \(id): destroyed")
    }
}

for i in 1...3 {
    let student = Student(id: i)
    print("Student \(student.id)...")
}

print()

var students = [Student]()

for i in 1...3 {
    let student = Student(id: i)
    print("Student \(student.id)...")
    students.append(student)
}

print("loop finished")
students.removeAll()
print("array cleared")


// working with variables inside classes
let constantUser = User()
constantUser.username = "Taylor"
print(constantUser.username)


// checkpoint 7:
// - make a class hierarchy for animals
// - start with `Animal`. Add a `legs` property for the # of legs an animal has
// - make `Dog` a subclass of `Animal`, giving it a `speak()` method that prints a dog barking string but each subclass should print something different
// - make `Corgi` and `Poodle` subclasses of `Dog`
// - make `Cat` an `Animal` subclass. Add a `speak()` method, with each subclass printing something different, and an `isTame` Boolean, set with an initializer
// - finally, make `Persian` and `Lion` subclasses of `Cat`

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("i'm a dog with \(legs) legs and i: bark bark bark!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("i'm a corgi dog with \(legs) legs and i: bark bark bark")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("i'm a poodle dog with \(legs) legs and i: woof woof woof")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        var tameText: String = isTame ? "tame" : "untamed"
        print("i'm a \(tameText) cat with \(legs) legs and i: meow meow meow")
    }
}

final class Persian: Cat {
    override func speak() {
        var tameText: String = isTame ? "tame" : "untamed"
        print("i'm a \(tameText) persian cat with \(legs) legs and i: meow meow meow")
    }
}

final class Lion: Cat {
    override func speak() {
        var tameText: String = isTame ? "tame" : "untamed"
        print("i'm a \(tameText) lion cat with \(legs) legs and i: roar roar roar")
    }
}

let dog = Dog(legs: 4)
dog.speak()

let corgi = Corgi(legs: 4)
corgi.speak()

let poodle = Poodle(legs: 4)
poodle.speak()

let cat = Cat(legs: 4, isTame: true)
cat.speak()

let persian = Persian(legs: 4, isTame: true)
persian.speak()

let lion = Lion(legs: 4, isTame: false)
lion.speak()
