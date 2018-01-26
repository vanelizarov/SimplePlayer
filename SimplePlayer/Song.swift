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
    
    // TODO: add artwork field
    
    lazy var fullTitle: String = {
        return "\(self.artist) - \(self.title)"
    }()
    
    init(title: String, artist: String) {
        self.id = UUID()
        self.title = title
        self.artist = artist
    }
}
