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
    var aI : Bool
    
    
    init(name: String, nr: Int, color: [Float], aI: Bool) {
        self.name = name
        self.nr = nr
        self.color = color
        self.aI = aI
    }

    
    func makeAMove(board: [Int], turn: Int) -> Int {
        var position = 10
        var board = board
        var opponent: Int
        if self.nr == 1 {
            opponent = 2
        }else{
            opponent = 1
        }
        let opp = opponent
        
        
        if turn == 1 {
            board[4] = self.nr
            position = 4
        }
        
        if turn == 2 {
            if board[4] == 0 {
                position = 4
            }else{
                position = 0
            }
        }
        
        if turn == 3 {
            if board[1] == opp || board[3] == opp {
                board[0] = self.nr
                position = 0
            }else if board[5] == opp || board[7] == opp {
                board[8] = self.nr
                position = 8
            }else if board[0] == opp || board[8] == opp {
                board[2] = self.nr
                position = 2
            }else if board[2] == opp || board[6] == opp {
                board[0] = self.nr
                position = 0
            }
        }
        
        if turn >= 4 {
            if board[0] == opp || board[1] == opp || board[2] == 0 {
                board[2] = self.nr
                position = 2
            }else if board[0] == 0 {
                board[0] = self.nr
                position = 0
            }else if board[1] == 0 {
                board[1] = self.nr
                position = 1
            }else if board[2] == 0 {
                board[2] = self.nr
                position = 2
            }else if board[3] == 0 {
                board[3] = self.nr
                position = 3
            }else if board[4] == 0 {
                board[4] = self.nr
                position = 4
            }else if board[5] == 0 {
                board[5] = self.nr
                position = 5
            }else if board[6] == 0 {
                board[6] = self.nr
                position = 6
            }else if board[7] == 0 {
                board[7] = self.nr
                position = 7
            }else if board[8] == 0 {
                board[8] = self.nr
                position = 8
            }
        }
        return position 
    }
    
    
}



