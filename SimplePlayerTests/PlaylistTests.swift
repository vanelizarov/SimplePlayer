//
//  PlaylistTest.swift
//  SimplePlayerTests
//
//  Created by vanya elizarov on 24/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import XCTest
@testable import SimplePlayer

class PlaylistTests: XCTestCase {
    
    var playlist: Playlist!
    
    override func setUp() {
        super.setUp()
        self.playlist = Playlist(name: "Neck Deep - The Peace And The Panic")
        
        let title = "Parachute"
        let artist = "Deep Neck"
        
        let song = Song(title: title, artist: artist)
        self.playlist.addSong(song)
    }
    
    override func tearDown() {
        self.playlist = nil
        super.tearDown()
    }
    
    func testSongAddedToPlaylist() {
        XCTAssertEqual(self.playlist.length, 1, "song was not added to playlist")
    }
    
    func testSongInPlaylistUpdated() {
        let newTitle = "Motion Sickness"
        let newArtist = "Neck Deep"
        
        self.playlist.updateSong(at: 0, title: newTitle, artist: nil)
        
        XCTAssertEqual(self.playlist.getSong(at: 0).title, newTitle, "song title was not updated")
        
        self.playlist.updateSong(at: 0, title: nil, artist: newArtist)
        
        XCTAssertEqual(self.playlist.getSong(at: 0).artist, newArtist, "song title was not updated")
    }
    
    func testSongRemovedFromPlaylist() {
        _ = self.playlist.removeSong(at: 0)
        
        XCTAssertEqual(self.playlist.length, 0, "song was not deleted from playlist")
    }
    
}
