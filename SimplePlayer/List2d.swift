//
//  List2d.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 26/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import Foundation

internal class Node<T>: Equatable  {
    var next: Node<T>!
    var prev: Node<T>!
    
    var value: T
    var index: Int!
    
    init(value: T) {
        self.value = value
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.index == rhs.index
    }
}

class List2d<S> {
    
    private(set) var items: [Node<S>]
    
    var length: Int {
        get {
            return self.items.count
        }
    }
    
    init() {
        self.items = []
    }
    
    func get(at index: Int) -> Node<S> {
        return self.items[index]
    }
    
    func append(item: S) -> Void {
        let node = Node<S>(value: item)
        node.index = self.length
        
        if self.items.count == 0 {
            node.next = node
            node.prev = node
        } else {
            node.next = self.items.first
            node.prev = self.items.last
            
            self.items.first?.prev = node
            self.items.last?.next = node
        }
        
        self.items.append(node)
    }
    
    func insert(item: S, at index: Int) -> Void {
        if index == self.length {
            self.append(item: item)
        } else {
            let node = Node<S>(value: item)
            node.index = index
            
            if index == 0 {
                node.prev = self.items.last
                node.next = self.items.first
                self.items.first?.prev = node
                self.items.last?.next = node
            } else {
                node.next = self.items[index]
                node.prev = self.items[index - 1]
                self.items[index].prev = node
                self.items[index - 1].next = node
            }
            
            self.changeIndexes(from: index, to: self.length - 1, by: 1)
            self.items.insert(node, at: index)
        }
    }
    
    func remove(at index: Int) -> Node<S> {
        if self.length == 1 {
            return self.items.remove(at: index)
        }
        
        if index == 0 {
            self.items[1].prev = self.items.last
            self.items.last?.next = self.items[1]
        } else if index == self.items.count - 1 {
            self.items[self.length - 2].next = self.items.first
            self.items.first?.prev = self.items[self.length - 2]
        } else {
            self.items[index - 1].next = self.items[index + 1]
            self.items[index + 1].prev = self.items[index - 1]
        }
        
        self.changeIndexes(from: index + 1, to: self.length - 1, by: -1)
        
        return self.items.remove(at: index)
    }
    
    func move(from fromIndex: Int, to toIndex: Int) -> Void {
        let node = self.remove(at: fromIndex)
        self.insert(item: node.value, at: toIndex)
    }
    
    private func changeIndexes(from fromIndex: Int, to toIndex: Int, by value: Int) {
        for i in fromIndex ... toIndex {
            self.items[i].index! += value
        }
    }
    
}














