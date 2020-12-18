//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-17.
//

import Foundation

class Player {
    var name : String
    var nr : Int
    var color : [Float]
    var wins = 0
    var draws = 0
    var positionsOwned = [Int]()
    
    
    init(name: String, nr: Int, color: [Float]) {
        self.name = name
        self.nr = nr
        self.color = color
    }
}
