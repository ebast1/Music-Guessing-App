//
//  GameView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/29/25.
//

import SwiftUI

struct GameView: View {
    @Binding var path: [GameNavigation]
    @ObservedObject var settings: GameSettings
    
    @State private var selectedAnswer: String? = nil
    @State private var currentRoundIndex: Int = 0
    @State private var hasAnswered = false
    @State private var wasCorrect = false
    @State private var isGameOver = false
    
    @State private var questions: [AudioQuestion] = []
    
    var currentQuestion: AudioQuestion {
        questions[currentRoundIndex]
    }
    
    var choices: [String] {
        currentQuestion.choices
    }
    
    func colorForChoice(_ choice: String) -> Color {
        guard hasAnswered else { return Color.gray.opacity(0.2) }
        
        if choice == selectedAnswer {
            return choice == currentQuestion.showName ? .green : .red
        } else if choice == currentQuestion.showName {
            return .green
        } else {
            return Color.gray.opacity(0.2)
        }
    }
    
    func textColorForChoice(_ choice: String) -> Color {
        guard hasAnswered else {
            return .blue
        }
        
        if choice == selectedAnswer {
            return .white
        } else if choice == currentQuestion.showName {
            return .white
        } else {
            return .blue
        }
    }
    
    func generateQuestions(count: Int, difficulty: Difficulty, genre: Genre) -> [AudioQuestion] {
        let sampleShows: [String] = [
            "Breaking Bad", "The Office", "Stranger Things", "Friends",
            "Game of Thrones", "The Mandalorian", "Bridgerton", "Sherlock"
        ]

        var questions: [AudioQuestion] = []

        for _ in 0..<count {
            let correctAnswer = sampleShows.randomElement()!

            let incorrectChoices = sampleShows.filter { $0 != correctAnswer }.shuffled()

            var choices = Array(incorrectChoices.prefix(3))

            choices.append(correctAnswer)

            choices.shuffle()

            let question = AudioQuestion(showName: "Placeholder", songName: "placeholder", songType: "opening", isMulitpleChoice: true, choices: Array(choices))
            questions.append(question)
        }

        return questions
    }
    
    var body: some View {
        let isLastQuestion = currentRoundIndex == questions.count - 1
        
        VStack {
            if questions.isEmpty {
                Text("Loading Questions...")
            }
            else {
                Text("Question \(currentRoundIndex + 1) of \(questions.count)")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Text("Guess the Show")
                    .font(.title)
                    .fontWeight(.bold)
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 400, height: 250)
                    Text("Gameplay Area")
                        .foregroundStyle(.blue)
                }
                .padding(.bottom, 20)
                
                ForEach(choices, id: \.self) { choice in
                    AnswerButtonView(
                        buttonText: choice,
                        backgroundColor: colorForChoice(choice),
                        foregroundColor: textColorForChoice(choice),
                        action: {
                            if !hasAnswered {
                                selectedAnswer = choice
                                hasAnswered = true
                                wasCorrect = (choice == currentQuestion.showName)
                            }
                        },
                        disabled: hasAnswered
                    )
                }
                
                Button(isLastQuestion ? "Finish" : "Next") {
                    if !isLastQuestion {
                        currentRoundIndex += 1
                        selectedAnswer = nil
                        hasAnswered = false
                        wasCorrect = false
                    } else {
                        path.append(GameNavigation.summary)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .buttonStyle(NextButtonStyle())
                .disabled(!hasAnswered)
                .padding(.top)
            }
        } // End of VStack
        .onAppear {
            print("Generating \(settings.selectedRound) questions")
            if questions.isEmpty {
                questions = generateQuestions(
                    count: settings.selectedRound,
                    difficulty: settings.difficulty,
                    genre: settings.genre
                )
            }
        } // End of .onAppear
        
    }
}

#Preview {
    let mockSettings = GameSettings()
    mockSettings.selectedRound = 3
    mockSettings.genre = .any
    mockSettings.difficulty = .easy
    mockSettings.selectedGameMode = .multipleChoice
    
    return GameView(
        path: .constant([]),
        settings: mockSettings
    )
}

// Gameplay Flow

// Load an AudioQuestion
// Use AVAudioPlayer to play audioClipName
// Display choices
// Compare tapped choice to showName -> Give feedback
// Continue to next Quesiton

