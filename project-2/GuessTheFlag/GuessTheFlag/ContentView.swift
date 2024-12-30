//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shawn Schwartz on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    // properties to store game data
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)  // the 3 flags

    @State private var showingScore = false
    @State private var scoreTitle = ""

    var body: some View {
        ZStack {
//            LinearGradient(
//                colors: [.blue, .black],
//                startPoint: .top,
//                endPoint: .bottom
//            )
//                .ignoresSafeArea()

            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()

//            VStack(spacing: 30) {
            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))  // you can also just do .bold() because it's so common
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        // instructions for player
                        Text("Tap the flag of")
//                            .foregroundStyle(.white)
                        // use iOS vibrancy effect
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))  // dynamic type for accessibility (test with environment overrides when running the simulator)

                        Text(countries[correctAnswer])
//                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)  // frosted glass
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("continue", action: askQuestion)
        } message: {
            Text("your score is ???")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
