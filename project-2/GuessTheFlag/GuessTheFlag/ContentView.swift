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

    // challenge 1:
    // Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.
    @State private var userScore = 0

    // challenge 2:
    // When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.

    // challenge 3:
    // Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.
    let maxNumQuestions = 8
    @State private var currentQuestionNum = 0
    @State private var gameOver = false

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

                Text("Score: \(userScore)/\(maxNumQuestions)")
                    .foregroundStyle(.white)
                    .font(.title.bold())

                Text("Question: \(currentQuestionNum)/\(maxNumQuestions)")
                    .foregroundStyle(.white)
                    .font(.title.bold().italic())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("continue", action: askQuestion)
        } message: {
            Text("your score is: \(userScore)/\(maxNumQuestions)")
        }
        .alert("Game Over!", isPresented: $gameOver) {
            Button("Play again!", role: .cancel, action: reloadGame)
        } message: {
            Text("your final score is: \(userScore)/\(maxNumQuestions)")
        }

    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])!"
        }

        currentQuestionNum += 1
        print(currentQuestionNum)

        if currentQuestionNum == maxNumQuestions {
            gameOver.toggle()
        } else {
            showingScore.toggle()
        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func reloadGame() {
        currentQuestionNum = 0
        userScore = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
