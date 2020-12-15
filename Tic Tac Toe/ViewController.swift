//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {

    
    var positions = [Int]()
    var currentPlayer = 1
    var win = false
    var currentRound = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        for _ in 1...9 {
            positions.append(0)
        }

    
        print(positions)
        positions[0] = currentPlayer
        print(positions)
        checkForWin()
        
        positions[3] = currentPlayer
        print(positions)
        checkForWin()
        
        positions[1] = currentPlayer
        print(positions)
        checkForWin()
        
        positions[4] = currentPlayer
        print(positions)
        checkForWin()
        
        positions[2] = currentPlayer
        print(positions)
        checkForWin()
        
    }
    
    
    
    func nextPlayer() {
        currentRound += 1
        if currentPlayer == 2 {
            currentPlayer = 1
        }else{
            currentPlayer += 1
        }
        //wait for next input
    }
    
    func gameWon() {
        print("Player \(currentPlayer) won!")
    }
    

    func checkForWin() {
        if  positions[0] == positions[1] && positions[0] == positions[2] && positions[0] != 0 {
            win = true
        }else if positions[3] == positions[4] && positions[3] == positions[5] && positions[3] != 0 {
            win = true
        }else if positions[6] == positions[7] && positions[6] == positions[8] && positions[6] != 0 {
            win = true
        }else if positions[0] == positions[3] && positions[0] == positions[3] && positions[0] != 0 {
            win = true
        }else if positions[1] == positions[4] && positions[1] == positions[7] && positions[1] != 0 {
            win = true
        }else if positions[2] == positions[5] && positions[2] == positions[8] && positions[2] != 0 {
            win = true
        }else if positions[0] == positions[4] && positions[0] == positions[8] && positions[0] != 0 {
            win = true
        }else if positions[2] == positions[4] && positions[2] == positions[6] && positions[2] != 0 {
            win = true
        }
        
        if win == false && currentRound <= 9 {
            nextPlayer()
        }else{
            gameWon()
        }
    }

}

