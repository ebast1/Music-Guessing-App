//
//  GameView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/29/25.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Button(action: {
                dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Exit Game")
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .foregroundStyle(Color.red)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .position(x: 80, y: 35)
            
            VStack {
                
                Text("Guess the Anime")
                    .font(.title)
                    .fontWeight(.bold)
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 300)
                    Text("Gameplay Area")
                        .foregroundStyle(.blue)
                }
                .padding(.bottom, 30)
                
                Section {
                    Button("Option 1") {}
                    Button("Option 1") {}
                    Button("Option 1") {}
                    Button("Option 1") {}
                }
                .frame(width: 300, height: 50)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    GameView()
}
