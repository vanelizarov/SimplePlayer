//
//  List2dTests.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 26/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import XCTest
@testable import SimplePlayer

class List2dTests: XCTestCase {
    
    var list: List2d<Song>!
    
    override func setUp() {
        super.setUp()
        
        self.list = List2d<Song>()
        
    }
    
    override func tearDown() {
        self.list = nil
        super.tearDown()
    }
    
    func testItemAddedToList() {
        let song = Song(title: "Defy", artist: "Of Mice & Men")
        self.list.append(item: song)
        
        XCTAssertEqual(self.list.length, 1, "item was not added to list")
    }
    
    func testItemInsertedAtSpecifiedIndex() {
        let songA = Song(title: "Wipeout", artist: "Crossfaith")
        let songB = Song(title: "Hansha", artist: "Oceans Ate Alaska")
        let songC = Song(title: "Last Looks", artist: "Silverstein")
        
        self.list.append(item: songA)
        self.list.append(item: songC)
        self.list.insert(item: songB, at: 1)
        
        XCTAssertEqual(self.list.get(at: 1).value.id, songB.id, "inserting at index not wrking")
        
    }
    
    func testItemRemovedFromList() {
        let songA = Song(title: "Wipeout", artist: "Crossfaith")
        let songB = Song(title: "Hansha", artist: "Oceans Ate Alaska")
        let songC = Song(title: "Last Looks", artist: "Silverstein")
        
        self.list.append(item: songA)
        self.list.append(item: songB)
        self.list.append(item: songC)
        
        _ = self.list.remove(at:  1)
        
        XCTAssertEqual(self.list.get(at: 0).next, self.list.get(at: self.list.length - 1), "removing second of three elements not working")
        
        _ = self.list.remove(at:  1)

        XCTAssertEqual(self.list.get(at: 0).prev, self.list.get(at: self.list.length - 1), "removing second of two elements not working")
        
        _ = self.list.remove(at:  0)

        XCTAssertEqual(self.list.length, 0, "removing last item not working")

    }
    
    func testLinking() {
        let song0 = Song(title: "Defy", artist: "Of Mice & Men")
        let song1 = Song(title: "The Sights", artist: "Enter Shikari")
        
        self.list.append(item: song0)
        
        XCTAssertEqual(self.list.get(at: 0), self.list.get(at: 0).next, "linking for next not working with one item in list")
        XCTAssertEqual(self.list.get(at: 0), self.list.get(at: 0).prev, "linking for prev not working with one item in list")

        
        self.list.append(item: song1)
        
        XCTAssertEqual(self.list.get(at: 0).next, self.list.get(at: 1), "linking for next not working with two items in list")
        XCTAssertEqual(self.list.get(at: 1).prev, self.list.get(at: 0), "linking for prev not working with two items in list")
    }
}
















