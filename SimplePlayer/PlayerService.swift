//
//  PlayerService.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 06/02/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import Foundation
import RxSwift

class PlayerService {
    
    static let shared: PlayerService = PlayerService()
    
    private (set) var queue: PublishSubject<Song>!
    private (set) var isPlaying: PublishSubject<Bool>!
    
    private var currentSong: Song!
    
    private init() {
        self.queue = PublishSubject<Song>()
        self.isPlaying = PublishSubject<Bool>()
    }
    
    func enqueue(song: Song) {
    
        if self.currentSong != nil {
            self.pause()
        }
        
        self.currentSong = song
        self.currentSong.isPlaying = true
        self.queue.onNext(song)
        self.play()
    }
    
    func play() {
        self.isPlaying.onNext(true)
        self.currentSong.isPlaying = true
    }
    
    func pause() {
        self.isPlaying.onNext(false)
        self.currentSong.isPlaying = false
    }
    
}
