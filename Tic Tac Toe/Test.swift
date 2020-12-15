//
//  Test.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-15.
//

import Foundation

class Test {

var positions = [Int]()
var currentPlayer = 1
var win = false


func nextPlayer() {
    if currentPlayer == 2 {
        currentPlayer = 1
    }else{
        currentPlayer += 1
    }
}

func gameWon() {
    
}

func checkForWin() {
    if  positions[0] == positions[1] && positions[0] == positions[2]  {
        win = true
    }else if positions[3] == positions[4] && positions[3] == positions[5] {
        win = true
    }else if positions[6] == positions[7] && positions[6] == positions[8] {
        win = true
    }else if positions[0] == positions[3] && positions[0] == positions[3] {
        win = true
    }else if positions[1] == positions[4] && positions[1] == positions[7] {
        win = true
    }else if positions[2] == positions[5] && positions[2] == positions[8] {
        win = true
    }else if positions[0] == positions[4] && positions[0] == positions[8] {
        win = true
    }else if positions[2] == positions[4] && positions[2] == positions[6] {
        win = true
    }
    
    if win == false {
        nextPlayer()
    }else{
        gameWon()
    }
}


for _ in 1...9 {
    positions.append(0)
}

print(positions)
positions[0] = currentPlayer
print(positions)
nextPlayer()

positions[1] = currentPlayer
print(positions)
nextPlayer()

positions[2] = currentPlayer
print(positions)
nextPlayer()

positions[3] = currentPlayer
print(positions)
nextPlayer()

positions[4] = currentPlayer
print(positions)
nextPlayer()

positions[5] = currentPlayer
print(positions)





}

