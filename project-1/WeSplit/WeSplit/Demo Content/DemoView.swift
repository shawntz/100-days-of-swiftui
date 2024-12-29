//
//  DemoView.swift
//  WeSplit
//
//  Created by Shawn Schwartz on 12/28/24.
//
// Notes:
//  * Views are a function of their state
//

import SwiftUI

struct DemoView: View {
//    @State private var tapCount = 0

//    @State private var name = ""

    let students = ["Harry", "Hermione", "Ron"]  // this array can remain constant without state binding because it will never change
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {  // the \.self exists because swiftui needs to uniquely identify each item in the array so that the UI can update correctly (this won't work though when there are non-unique elements in the array)
                        Text($0)
                    }
                }
                //            ForEach(0..<100) { number in
                //                Text("Row \(number)")
                //            }
//                ForEach(0..<100) {
//                    Text("Row \($0)")
//                }
            }
            .navigationTitle("Select a student")
        }
//        Form {
//            TextField("enter your name", text: $name)  // $ tells swift to read/write the value (i.e., a two-way binding)
//            Text("Hello, \(name)")  // just writing the variable means I just want to read the value
//        }
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }

//        NavigationStack {
//            Form {
//                Section {
//                    Text("Hello, world!")
//                }
//
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }

    }
}

#Preview {
    DemoView()
}
