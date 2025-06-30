//
//  songs.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/27/25.
//

import Foundation
import SwiftData
import Swift
import SwiftUI

class Songs{
    
    // Things this class needs
    // Name for the show the song is from
    // Images for the show incase they way another version (LATER FEATURE, START FEATURE IS MUSIC)
    // Song file to play
    
    var name : String
    var image : Image
    var song : URL
    
    init(name : String, image : Image, song : URL){
        self.name = name
        self.image = image
        self.song = song
    }
}

