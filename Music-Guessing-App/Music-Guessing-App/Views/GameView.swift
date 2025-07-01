//
//  GameView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/29/25.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedAnswer: String? = nil
    @State private var currentRoundIndex: Int = 0
    @State private var hasAnswered = false
    @State private var wasCorrect = false
    
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
    
    var body: some View {
        VStack {
            Text("Guess the Show")
                .font(.title)
                .fontWeight(.bold)
            
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: .infinity, height: 300)
                Text("Gameplay Area")
                    .foregroundStyle(.blue)
            }
            .padding(.bottom, 20)
            
            ForEach(choices, id: \.self) { choice in
                AnswerButtonView(
                    buttonText: choice,
                    backgroundColor: colorForChoice(choice),
                    action: {
                        if !hasAnswered {
                            selectedAnswer = choice
                            hasAnswered = true
                            wasCorrect = (choice == currentQuestion.showName)
                        }
                    }
                )
            }
            
            if selectedAnswer != nil {
                Button(action: {
                    // Handle advancing to the next question here
                }) {
                    NextButtonStyle(action: {})
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    GameView(questions: sampleQuestions)
}
