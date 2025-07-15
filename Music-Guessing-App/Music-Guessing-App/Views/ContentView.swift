//
//  ContentView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [GameNavigation] = []
    
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 300 , height: 200)
                        .padding()
                    
                    Text("Logo")
                        .foregroundStyle(.white)
                }
                
//                Section {
//                    HomeButtonSytle(location: {GameView(questions: sampleQuestions)}, buttonText: "Start Game", colored: true)
//                    HomeButtonSytle(location: {LibraryView()}, buttonText: "SongLibrary", colored: false)
//                    HomeButtonSytle(location: {SettingsView()}, buttonText: "Settings",  colored: false)
//                }
                
                Section {
                    Button("Start Game") {
                        path.append(GameNavigation.game)
                    }
                    Button("Song Library") {
                        path.append(GameNavigation.songLibrary)
                    }
                    Button("Settings") {
                        path.append(GameNavigation.settings)
                    }
                }
                .buttonStyle(.bordered)
                .padding(5)
            }
            .padding(5)
            .navigationDestination(for: GameNavigation.self) { destination in switch destination {
            case GameNavigation.game:
                GameView(questions: sampleQuestions)
            case GameNavigation.songLibrary:
                LibraryView()
            case GameNavigation.settings:
                SettingsView()
            case GameNavigation.summary:
                SummaryView()
            }
            }
            
        }
    }
}
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

//


#Preview {
    ContentView()
}
