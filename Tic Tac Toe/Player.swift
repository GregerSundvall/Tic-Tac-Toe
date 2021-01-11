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
        let p0 = board[0]
        let p1 = board[1]
        let p2 = board[2]
        let p3 = board[3]
        let p4 = board[4]
        let p5 = board[5]
        let p6 = board[6]
        let p7 = board[7]
        let p8 = board[8]
        
        var opponent: Int
        if self.nr == 1 {
            opponent = 2
        }else{
            opponent = 1
        }
        let opp = opponent
        
        if turn == 1 {
            position = 4
        }
        
        if turn == 2 {
            if p4 == 0 {
                position = 4
            }else{
                position = 0
            }
        }
        
        if turn == 3 {
            if p1 == opp || p3 == opp {
                position = 0
            }else if p5 == opp || p7 == opp {
                position = 8
            }else if p0 == opp || p8 == opp {
                position = 2
            }else if p2 == opp || p6 == opp {
                position = 0
            }
        }
        
        if turn >= 4 {
            if (turn == 4) && ((p0 == opp) && (p8 == opp) || (p2 == opp) && (p6 == opp)) {
                position = 1
            //Check for own potential 3-in-a-rows
            }else if p0 == self.nr && p1 == self.nr && p2 == 0 {
                position = 2
            }else if p0 == self.nr && p1 == 0 && p2 == self.nr {
                position = 1
            }else if p0 == 0 && p1 == self.nr && p2 == self.nr {
                position = 0
            //Middle row
            }else if p3 == self.nr && p4 == self.nr && p5 == 0 {
                position = 5
            }else if p3 == self.nr && p4 == 0 && p5 == self.nr {
                position = 4
            }else if p3 == 0 && p4 == self.nr && p5 == self.nr {
                position = 3
            //Lower row
            }else if p6 == self.nr && p7 == self.nr && p8 == 0 {
                position = 8
            }else if p6 == self.nr && p7 == 0 && p8 == self.nr {
                position = 7
            }else if p6 == 0 && p7 == self.nr && p8 == self.nr {
                position = 6
            //Left column
            }else if p0 == self.nr && p3 == self.nr && p6 == 0 {
                position = 6
            }else if p0 == self.nr && p3 == 0 && p6 == self.nr {
                position = 3
            }else if p0 == 0 && p3 == self.nr && p6 == self.nr {
                position = 0
            //Middle column
            }else if p1 == self.nr && p4 == self.nr && p7 == 0 {
                position = 7
            }else if p1 == self.nr && p4 == 0 && p7 == self.nr {
                position = 4
            }else if p1 == 0 && p4 == self.nr && p7 == self.nr {
                position = 1
            //Right column
            }else if p2 == self.nr && p5 == self.nr && p8 == 0 {
                position = 8
            }else if p2 == self.nr && p5 == 0 && p8 == self.nr {
                position = 5
            }else if p2 == 0 && p5 == self.nr && p8 == self.nr {
                position = 2
            //Diagonal one
            }else if p0 == self.nr && p4 == self.nr && p8 == 0 {
                position = 8
            }else if p0 == self.nr && p4 == 0 && p8 == self.nr {
                position = 4
            }else if p0 == 0 && p4 == self.nr && p8 == self.nr {
                position = 0
            //Diagonal two
            }else if p2 == self.nr && p4 == self.nr && p6 == 0 {
                position = 6
            }else if p2 == self.nr && p4 == 0 && p6 == self.nr {
                position = 4
            }else if p2 == 0 && p4 == self.nr && p6 == self.nr {
                position = 2
            
            
            
            
            
            //check for opponents potential 3-in-a-rows
            //Upper row
            }else if p0 == opp && p1 == opp && p2 == 0 {
                position = 2
            }else if p0 == opp && p1 == 0 && p2 == opp {
                position = 1
            }else if p0 == 0 && p1 == opp && p2 == opp {
                position = 0
            //Middle row
            }else if p3 == opp && p4 == opp && p5 == 0 {
                position = 5
            }else if p3 == opp && p4 == 0 && p5 == opp {
                position = 4
            }else if p3 == 0 && p4 == opp && p5 == opp {
                position = 3
            //Lower row
            }else if p6 == opp && p7 == opp && p8 == 0 {
                position = 8
            }else if p6 == opp && p7 == 0 && p8 == opp {
                position = 7
            }else if p6 == 0 && p7 == opp && p8 == opp {
                position = 6
            //Left column
            }else if p0 == opp && p3 == opp && p6 == 0 {
                position = 6
            }else if p0 == opp && p3 == 0 && p6 == opp {
                position = 3
            }else if p0 == 0 && p3 == opp && p6 == opp {
                position = 0
            //Middle column
            }else if p1 == opp && p4 == opp && p7 == 0 {
                position = 7
            }else if p1 == opp && p4 == 0 && p7 == opp {
                position = 4
            }else if p1 == 0 && p4 == opp && p7 == opp {
                position = 1
            //Right column
            }else if p2 == opp && p5 == opp && p8 == 0 {
                position = 8
            }else if p2 == opp && p5 == 0 && p8 == opp {
                position = 5
            }else if p2 == 0 && p5 == opp && p8 == opp {
                position = 2
            //Diagonal one
            }else if p0 == opp && p4 == opp && p8 == 0 {
                position = 8
            }else if p0 == opp && p4 == 0 && p8 == opp {
                position = 4
            }else if p0 == 0 && p4 == opp && p8 == opp {
                position = 0
            //Diagonal two
            }else if p2 == opp && p4 == opp && p6 == 0 {
                position = 6
            }else if p2 == opp && p4 == 0 && p6 == opp {
                position = 4
            }else if p2 == 0 && p4 == opp && p6 == opp {
                position = 2
            
            
            
            
            
            
                //Start of failsafes
            }else if board[0] == 0 {
                position = 0
            }else if board[2] == 0 {
                position = 2
            }else if board[6] == 0 {
                position = 6
            }else if board[8] == 0 {
                position = 8
            }else if board[1] == 0 {
                position = 1
            }else if board[3] == 0 {
                position = 3
            }else if board[5] == 0 {
                position = 5
            }else if board[7] == 0 {
                position = 7
            }
            
        }
        return position 
    }
    
    
}



