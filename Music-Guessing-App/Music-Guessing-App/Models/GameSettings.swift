//
//  GameSettings.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/15/25.
//

import SwiftUI
import Swift

class GameSettings: ObservableObject {
    @Published var selectedRound: Int = 1
    @Published var selectedGameMode: GameMode = .multipleChoice
    @Published var difficulty: Difficulty = .easy
    @Published var genre: Genre = .action
}
