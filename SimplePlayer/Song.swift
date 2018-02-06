//
//  Song.swift
//  Simple Player
//
//  Created by vanya elizarov on 24/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import Foundation

class Song {
    var id: UUID? = nil
    
    var title: String = ""
    var artist: String = ""
    
    var isPlaying: Bool = false
    
    // TODO: add artwork field
    
    var fullTitle: String {
        get {
            return "\(self.artist) - \(self.title)"
        }
    }
    
    init(title: String, artist: String) {
        self.id = UUID()
        self.title = title
        self.artist = artist
    }
}
