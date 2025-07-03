//
//  GameView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/29/25.
//

import SwiftUI

enum GameNavigation: Hashable {
    case summary
}

struct GameView: View {
    @State private var selectedAnswer: String? = nil
    @State private var currentRoundIndex: Int = 0
    @State private var hasAnswered = false
    @State private var wasCorrect = false
    @State private var isGameOver = false
    @State private var navigationSelection: GameNavigation? = nil
    
    let questions: [AudioQuestion]
        
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
    
    var body: some View {
        let isLastQuestion = currentRoundIndex == questions.count - 1
        
        NavigationStack {
            VStack {
                Text("Question \(currentRoundIndex + 1) of \(questions.count)")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Text("Guess the Show")
                    .font(.title)
                    .fontWeight(.bold)
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: .infinity, height: 250)
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
                        disabled: hasAnswered // ⬅ disables after one selection
                    )
                }
                
                Button(isLastQuestion ? "Finish" : "Next") {
                    if !isLastQuestion {
                        currentRoundIndex += 1
                        selectedAnswer = nil
                        hasAnswered = false
                        wasCorrect = false
                    } else {
                        navigationSelection = .summary
                    }
                }
                .disabled(!hasAnswered)
                
                NavigationLink(value: navigationSelection) {
                    EmptyView()
                }
            }
            .navigationDestination(for: GameNavigation.self) { nav in
                switch nav {
                case .summary:
                    SummaryView()
                }
            }
        }
    }
}

#Preview {
    GameView(questions: sampleQuestions)
}
