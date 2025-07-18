//
//  File.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/27/25.
//

import Foundation
import SwiftUI
import Swift

struct AudioQuestion: Codable, Identifiable {
    var id: Int
    var showName: String
    var songType: String
    var songName: String
    var isMultipleChoice: Bool
    var choices: [String]
    var genre: String
    var difficulty: String
    
    static let placeholder = AudioQuestion(
        id: 0,
        showName: "Unknown Show",
        songType: "opening",
        songName: "unknown_song.mp3",
        isMultipleChoice: true,
        choices: ["Option A", "Option B", "Option C", "Option D"],
        genre: "Any",
        difficulty: "Easy"
    )
    
}

// What does an AudioQuestion have

// a Show name (ie. Black Clover, Naruto)
// a Song name (ie. Black Rover, Blue Bird)
// a Song type (ie. opening, ending, insert song)

// an audio file
// an image

// a genre (ie. Action, Comedy, Romance)
// a difficulty (ie. Easy, Medium, Hard)

// ***********************************************************

// Comment from before

// English song name / Japanese song name
// Opening, Ending or Insert                     //Looking to change this to a switch property or enum to make it cleaner
// audio file that i get from data
// id of SongQuestion for individual use
// Bool that determines if this question is multiple choice or not
// multiple choice options that fills into the option buttons on GameView()
