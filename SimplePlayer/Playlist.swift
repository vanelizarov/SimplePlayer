//
//  Playlist.swift
//  Simple Player
//
//  Created by vanya elizarov on 24/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import Foundation

class Playlist: List2d<Song> {
    
    private(set) var id: UUID? = nil
    var name: String = ""
    var artist: String? = nil
    
    init(name: String) {
        super.init()
        
        self.id = UUID()
        self.name = name
    }
    
    init(name: String, artist: String) {
        super.init()
        
        self.id = UUID()
        self.name = name
        self.artist = artist
    }
    
    func update(at index: Int, title: String?, artist: String?) {
        if let title = title {
            self.get(at: index).value.title = title
        }
        
        if let artist = artist {
            self.get(at: index).value.artist = artist
        }
    }
}
