//
//  StartGameView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/15/25.
//

import SwiftUI

//      START GAME VIEW
//  NEEDS
// 1. A way to select the amount of ROUNDS
// 2. A way to select the type of gamemode to play (MC or TYPING)
// 3. A way to select the DIFFICULTY of songs
// 4. A way to select the GENRE of songs
// 5. A button to click to START the game

enum GameMode: String, CaseIterable {
    case multipleChoice = "Multiple Choice"
    case typing = "Typing"
}

enum Difficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

enum Genre: String, CaseIterable {
    case any = "Any"
    case action = "Action"
    case romance = "Romance"
    case adventure = "Adventure"
}

struct StartGameView: View {
    @Binding var path: [GameNavigation]
    @ObservedObject var settings: GameSettings
    
    var body: some View {
        VStack {
            
            // ******************************************** //
            Spacer()
            // ******************************************** //
            
            Text("Game Setup")
                .font(.largeTitle).bold()
            
            // ******************************************** //
            Spacer()
            // ******************************************** //
            
            // Round Selection
            Section {
                HStack {
                    Text("Amount of Rounds")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                
                Stepper(value: $settings.selectedRound, in: 1...10) {
                    Text("\(settings.selectedRound)")
                }
            }
            .padding(.horizontal)
            
            // Difficulty selection
            Section {
                HStack {
                    Text("Difficulty")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.top, 10)
                
                Picker("", selection: $settings.difficulty) {
                    ForEach(Difficulty.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.horizontal)
            
            // GameMode Selection
            Section {
                HStack {
                    Text("Game Mode")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.top, 10)
                
                Picker("", selection: $settings.selectedGameMode) {
                    ForEach(GameMode.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.horizontal)
            
            // Genre Selection
            Section{
                HStack {
                    Text(" Genre")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.top, 10)
                
                Picker("Genre", selection: $settings.genre){
                    ForEach(Genre.allCases,id: \.self) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .padding(.horizontal)
            
            // Start game Button
            Button("Start Game") {
                path.append(.game)
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .buttonStyle(HomeButtonStyle())
            
            // ******************************************** //
            Spacer()
            // ******************************************** //
            
        }
    }
}

#Preview {
    StartGameView(path: .constant([.game]), settings: GameSettings())
}
