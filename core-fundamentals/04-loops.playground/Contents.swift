import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
var countdown = 10

// standard for loop syntax in swift:
for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {  // all integer numbers between 1 and 12, as well as 1 and 12 themselves
    print("5 x \(i) is \(5 * i)")
}

print()

for i in 1..<12 {  // counts up to but excluding the final number
    print("Counting 1 up to 12: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {  // run loop without the loop variable
    lyric += " hate"
}

print(lyric)


// standard while loop syntax in swift:
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")

// random number generators
let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)
Double(String(format: "%.3f", amount))

// skipping iterations:
//  - continue skips the current loop iteration
//  - break exits a loop immediately and skips all remaining iterations
