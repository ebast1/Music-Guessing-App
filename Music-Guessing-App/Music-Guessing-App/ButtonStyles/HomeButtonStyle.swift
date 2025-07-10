//
//  HomeButtonStyle.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/30/25.
//

import SwiftUI

struct HomeButtonSytle: View{
    let buttonText: String
    let colored: Bool
    
    var body: some View {
        NavigationLink() {
            Text(buttonText)
                .frame(width: 300, height: 30)
                .padding()
                .background(colored ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(colored ? Color.white :Color.blue)
                .cornerRadius(8)
        }
    }
}

#Preview {
    HomeButtonSytle(location: {GameView(questions: sampleQuestions)}, buttonText: "Example Text", colored: false)
}
