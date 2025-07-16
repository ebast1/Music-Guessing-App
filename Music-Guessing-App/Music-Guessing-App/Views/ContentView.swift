//
//  ContentView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [GameNavigation] = []
    @StateObject private var gameSettings = GameSettings()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                
                ZStack {
                    Rectangle()
                        .frame(width: 400 , height: 300)
                        .padding()
                    
                    Text("Logo")
                        .foregroundStyle(.white)
                }
                
                Section {
                    Button("Start Game") {
                        path.append(GameNavigation.startGame)
                    }
                    Button("Song Library") {
                        path.append(GameNavigation.songLibrary)
                    }
                    .buttonStyle(HomeButtonStyle())
                    Button("Settings") {
                        path.append(GameNavigation.settings)
                    }
                    
                }
                .buttonStyle(HomeButtonStyle())
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(5)
                
            }
            .navigationDestination(for: GameNavigation.self) { destination in switch destination {
            case GameNavigation.startGame:
                StartGameView(path: $path, settings: gameSettings)
                    .navigationBarBackButtonHidden()
            case GameNavigation.game:
                GameView(path: $path, settings: gameSettings)
                    .navigationBarBackButtonHidden()
            case GameNavigation.songLibrary:
                LibraryView()
            case GameNavigation.settings:
                SettingsView()
            case GameNavigation.summary:
                SummaryView(path: $path)
                    .navigationBarBackButtonHidden()
            } // Switch statement Ends
            } // .navigationDestination Ends
            
        } // NavigationStack Ends
        
    } // End of body
    
} // End of ContentView()

// Where to start / What I need to make

// DESIGN
// - a home screen with with buttons to start a game
// - Start new game, settings, maybe a library of data
//  (START SMALL TO KEEP MOTIVATION)
// - a collection of images, songs, and other data for anime that I have currently
// - research the MVVM structure again to see how that will affect the structure of files

// GAMEPLAY
// - a way to show the user the current song through MUSIC or IMAGES
// - a way to allow the user to enter an answer whether it be through multiple choice buttons or entering a piece of text
// - a way to determine whether the user entered the correct answer or not
// - MAYBE a way to update a leaderboard to allow the user to show their scores and see others/friends scores
// - a way to have a time limit to make the game more competetive (Up to gameplay )

// DATA / MUSIC STORAGE
// - a way to have music stored
// - a way to have the answer stored
// - a way to have images stored
// - a way to have different random answers pop up

#Preview {
    ContentView()
}
