//
//  Playlist.swift
//  Simple Player
//
//  Created by vanya elizarov on 24/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import Foundation

class Playlist {
    
    private var songs: [Song] = []
    
    var id: UUID? = nil
    var name: String = ""
    
    var length: Int {
        get {
            return self.songs.count
        }
    }
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
    
    func getSong(at index: Int) -> Song {
        return self.songs[index]
    }
    
    func addSong(_ song: Song) -> Void {
        self.songs.append(song)
    }
    
    func removeSong(at index: Int) -> Song {
        return self.songs.remove(at: index)
    }
    
    func updateSong(at index: Int, title: String?, artist: String?) -> Void {
        self.songs[index].title = title == nil ? self.songs[index].title : title!
        self.songs[index].artist = artist == nil ? self.songs[index].artist : artist!
    }
}
