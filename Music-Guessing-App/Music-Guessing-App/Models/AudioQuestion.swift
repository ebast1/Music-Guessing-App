//
//  File.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/27/25.
//

import Foundation
import AVRouting
import AVFoundation


struct AudioQuestion: Identifiable{
    var showName : String
    var songName : String           // English song name / Japanese song name
    var songType : String           // Opening, Ending or Insert                     //Looking to change this to a switch property or enum to make it cleaner
    var audio : AVAudioFile?        // audio file that i get from data
    var id : UUID?                  // id of SongQuestion for individual use
    
    var isMulitpleChoice : Bool     // Bool that determines if this question is multiple choice or not
    var choices : [String]          // multiple choice options that fills into the option buttons on GameView()
}

let sampleQuestions: [AudioQuestion] = [
    AudioQuestion(
        showName: "Rick and Morty",
        songName: "rick_morty_intro",
        songType: "opening",
        isMulitpleChoice: true,
        choices: ["Futurama", "Rick and Morty", "Gravity Falls", "South Park"]
    ),
    
    AudioQuestion(
        showName: "SpongeBob SquarePants",
        songName: "spongebob_theme",
        songType: "opening",
        isMulitpleChoice: true,
        choices: ["Fairly OddParents", "Phineas and Ferb", "SpongeBob SquarePants", "The Simpsons"]
    ),
    
    AudioQuestion(
        showName: "Avatar: The Last Airbender",
        songName: "avatar_intro",
        songType: "opening",
        isMulitpleChoice: true,
        choices: ["Naruto", "Avatar: The Last Airbender", "The Legend of Korra", "One Piece"]
    ),
    
    AudioQuestion(
        showName: "Family Guy",
        songName: "familyguy_theme",
        songType: "opening",
        isMulitpleChoice: true,
        choices: ["American Dad", "Family Guy", "Bob’s Burgers", "The Cleveland Show"]
    ),
    
    AudioQuestion(
        showName: "The Simpsons",
        songName: "simpsons_theme",
        songType: "opening",
        isMulitpleChoice: true,
        choices: ["The Simpsons", "King of the Hill", "South Park", "Futurama"]
    ),
    
    AudioQuestion(
        showName: "Adventure Time",
        songName: "adventuretime_opening",
        songType: "opening",
        isMulitpleChoice: true,
        choices: ["Adventure Time", "Steven Universe", "Regular Show", "Over the Garden Wall"]
    )
]

// What does an AudioQuestion have

// a Show name (ie. Black Clover, Naruto)
// a Song name (ie. Black Rover, Blue Bird)
// a Song type (ie. opening, ending, insert song)

// an audio file
// an image

// a genre (ie. Action, Comedy, Romance)
// a difficulty (ie. Easy, Medium, Hard)
