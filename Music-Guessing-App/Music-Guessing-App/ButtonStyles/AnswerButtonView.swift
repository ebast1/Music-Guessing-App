//
//  AnswerButtonView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/1/25.
//

import SwiftUI

struct AnswerButtonView: View {
    let buttonText: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    let disabled: Bool

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .frame(width: 300, height: 30)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(8)
        }
        .disabled(disabled)
        .opacity(disabled ? 0.8 : 1.0) // Optional: make disabled buttons look faded
        .animation(.easeInOut(duration: 0.3), value: disabled) // ✅ animate opacity
        .animation(.easeInOut(duration: 0.3), value: backgroundColor) // ✅ animate background color
        .animation(.easeInOut(duration: 0.3), value: foregroundColor) // ✅ optional: animate text color
    }
}

#Preview {
    AnswerButtonView(buttonText: "Option 1", backgroundColor: .blue, foregroundColor: .white, action: {}, disabled: false)
}
