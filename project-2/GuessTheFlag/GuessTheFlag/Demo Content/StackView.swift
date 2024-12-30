//
//  StackView.swift
//  GuessTheFlag
//
//  Created by Shawn Schwartz on 12/29/24.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        // try making a 3x3 grid by stacking stacks
        VStack {
            HStack(alignment: .top) {
                Spacer()
                Rectangle()
                Spacer()

                Spacer()
                Rectangle()
                Spacer()

                Spacer()
                Rectangle()
                Spacer()
            }

            HStack(alignment: .top) {
                Spacer()
                Rectangle()
                Spacer()

                Spacer()
                Rectangle()
                Spacer()

                Spacer()
                Rectangle()
                Spacer()
            }

            HStack(alignment: .top) {
                Spacer()
                Rectangle()
                Spacer()

                Spacer()
                Rectangle()
                Spacer()

                Spacer()
                Rectangle()
                Spacer()
            }

//            HStack(alignment: .top, spacing: 150) {
//                Spacer()
//                Rectangle()
//                Spacer()
//            }
        }
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Hello, world!")
//            Text("This is another text view")
//        }
//        .padding()
//
//        HStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is another text view")
//        }
//
//        VStack {
//            Spacer()
//
//            Text("1")
//            Text("2")
//            Text("3")
//
//            Spacer()
//            Spacer()
//        }

    }
}

#Preview {
    StackView()
}
