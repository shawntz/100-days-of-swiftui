//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Shawn Schwartz on 12/31/24.
//
// Project Spec:
//  - each turn of the game randomly selects r, p, or s
//  - each turn the game will tell player to win or lose
//  - each turn player must tap the correct move to win or lose
//  - if correct, player scores 1 point, otherwise, they lose 1 point
//  - the game ends after 10 turns; here, their final score is shown
//
// Examples:
//  - App (Rock, W) -> Player (chooses: Paper)
//  - App (Rock, L) -> Player (chooses: Scissors)
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {


            Spacer()

            VStack(spacing: 15) {
                Text("""
                    Tap the correct move needed to either
                    WIN or LOSE again the CPU's choice. 
                    
                    Incorrect choices result in -1 points. 
                    
                    The game ends after 10 turns!
                    """
                )
//                .multilineTextAlignment(.center)
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
//                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .foregroundStyle(.primary)
                .clipShape(.rect(cornerRadius: 15))
            }
            .frame(width: .infinity, height: .infinity, alignment: .center)

            Spacer()

            HStack() {
                Spacer()

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                }
            }


        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()



//        Spacer()
    }
}

struct ChoicesView: View {
    let choices: [String]
    let number: Int
    let eval: (Int) -> Void

    var body: some View {
        Button {
            // choice was tapped
            eval(number)

            print(choices[number])
        } label: {
            Text(choices[number])
                .frame(maxWidth: .infinity)
                .padding()
                .font(.system(size: 60))
//                .background(Color(red: 0.53, green: 0.53, blue: 0.53))
                .background(.regularMaterial)
                .clipShape(.circle)
                .shadow(radius: 5)
        }
    }
}

struct CardView: View {
    let choices: [String]
    let number: Int
    let outcome: Bool

    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10) {
                Text("This round, your goal is to")
                    .font(.title2)

                Text("\(outcome ? "WIN" : "LOSE")")
                    .font(.largeTitle.weight(.semibold))
            }

            Text(choices[number])
                .frame(maxWidth: .infinity)
                .padding()
                .font(.system(size: 60))
                .background(Color(red: 0.149, green: 0.149, blue: 0.149))
                .clipShape(.circle)
                .shadow(radius: 30)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .font(.title.bold())
        .foregroundStyle(.white)
//        .background(Color(red: 0.96, green: 0.43, blue: 0.058))
        .background(Color(red: 0.105, green: 0.105, blue: 0.118))
        .clipShape(.rect(cornerRadius: 15))
        .shadow(radius: 5)
    }
}

struct ContentView: View {
    let choices = ["👊", "🖐️", "✌️"]
    let answers = ["🖐️", "✌️", "👊"]
    let maxTurns: Int = 10

    @State private var backgroundColor: Color? = nil
    @State private var isFlashing = false



    @State private var showInstructions: Bool = false
    @State private var gameOver: Bool = false
    @State private var currentTurn: Int = 1
    @State private var playerScore: Int = 0
    @State private var playerMove: String = ""
    @State private var playerShouldWin: Bool = Bool.random()
    @State private var prevGoal: Bool? = nil
    @State private var cpuChoice: Int = Int.random(in: 0...2)
    @State private var prevChoice: Int? = nil

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            (backgroundColor ?? defaultBackgroundColor)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeInOut(duration: 0.25), value: isFlashing)

            VStack {
                VStack {
                    Spacer()

                    Text("Rock, Paper, Scissors!")
                        .font(.title.bold())

                    Text("Round \(currentTurn)/\(maxTurns)")
                        .font(.title2.bold())

                    Spacer()

                    CardView(choices: choices, number: cpuChoice, outcome: playerShouldWin)

                    Spacer()

                    HStack {
                        ForEach(0..<3) { choice in
//                            ChoicesView(choices: choices, number: choice, eval: userTapped)
                            ChoicesView(choices: choices, number: choice, eval: { index in
                                flashBackground(condition: userTapped(index))
                            })
                        }
                    }
                    Spacer()

                    HStack(alignment: .bottom) {
                        Text("Score: \(playerScore)")
                            .font(.largeTitle.bold())

                        Spacer()

                        Button {
                            showInstructions.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                                .foregroundStyle(.gray)
                        } .font(.largeTitle)
                            .sheet(isPresented: $showInstructions) {
                                InstructionsView()
                                    .presentationDetents([.height(250), .medium, .large])
                                    .presentationDragIndicator(.automatic)
                            }
                    }

                }
                .padding()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                    //            alignment: .leading
                )
                //            .background(.primary)
            }
            .alert("Game Over!", isPresented: $gameOver) {
                Button("Play again!", role: .cancel, action: restartGame)
            } message: {
                Text("Final Score: \(playerScore)")
            }
        }
    }

    var defaultBackgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }

    func userTapped(_ number: Int) -> Bool {
        let correctAnswer = answers[cpuChoice]
        let userAnswer = choices[number]
        var isCorrect: Bool

        print("\(userAnswer) <--> \(correctAnswer)")

        if playerShouldWin {
            print("player should win:")
            if userAnswer == correctAnswer {
                playerScore += 1
                isCorrect = true
            } else {
                playerScore -= 1
                isCorrect = false
            }
        } else {
            print("player should lose:")

            if userAnswer != correctAnswer && userAnswer != choices[cpuChoice] {
                playerScore += 1
                isCorrect = true
            } else {
                playerScore -= 1
                isCorrect = false
            }
        }

        if currentTurn == maxTurns {
            gameOver.toggle()
        } else {
            currentTurn += 1
        }

        makeCPUMove()

        return isCorrect
    }

    func flashBackground(condition: Bool) {
        backgroundColor = condition ? Color.green : Color.red
        isFlashing = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            backgroundColor = nil
            isFlashing = false
        }
    }

    func makeCPUMove() {
        cpuChoice = uniqueRandomChoice(range: 0...2)
        playerShouldWin = uniqueRandomCPUMove()
    }

    func restartGame() {
        currentTurn = 1
        playerScore = 0
        makeCPUMove()
    }

    func uniqueRandomChoice(range: ClosedRange<Int>) -> Int {
        var newChoice: Int
        repeat {
            newChoice = Int.random(in: range)
        } while newChoice == prevChoice
        prevChoice = newChoice
        return newChoice
    }

    func uniqueRandomCPUMove() -> Bool {
        var newMove: Bool
        repeat {
            newMove = Bool.random()
        } while newMove == prevGoal
        prevGoal = newMove
        return newMove
    }
}

#Preview {
    ContentView()
}