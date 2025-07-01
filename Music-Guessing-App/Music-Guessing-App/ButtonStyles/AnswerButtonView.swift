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
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .frame(width: 300, height: 30)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

#Preview {
    AnswerButtonView(buttonText: "Option 1", backgroundColor: .blue, action: {})
}
