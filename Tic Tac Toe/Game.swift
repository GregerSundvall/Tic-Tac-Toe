//
//  Game.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-17.
//

import Foundation

class Game {
    var board = [Int]()
    var player1 : Player
    var player2 : Player
    var currentPlayer : Player
    var notCurrentPlayer : Player
    var win = false
    var currentTurn = 1
    var playAgain = 0
    
    init() {
        
        for _ in 1...9 {
            board.append(0)
        }
        
        player1 = Player(name: "Player 1", nr: 1, color: [0.0, 0.3, 0.4, 1.0], aI: true)
        player2 = Player(name: "Player 2", nr: 2, color: [0.4, 0.0, 0.2, 1.0], aI: true)
        
        let randomInt = Int.random(in: 1...100)
        if randomInt % 2 == 0 {
            currentPlayer = player1
            notCurrentPlayer = player2
        }else{
            currentPlayer = player2
            notCurrentPlayer = player1
        }
        
        
        
    }
    
    func setupPlayer1(name: String, color: [Float], aI: Bool) {
        player1.name = name
        player1.color = color
        player1.aI = aI
    }
    
    func setupPlayer2(name: String, color: [Float], aI: Bool) {
        player2.name = name
        player2.color = color
        player2.aI = aI
    }
    
    func anotherRound() {
        playAgain = 0
        board.removeAll()
        for _ in 1...9 {
            board.append(0)
        }
        
        player1.positionsOwned.removeAll()
        player2.positionsOwned.removeAll()
        win = false
        currentTurn = 1
        
        let randomInt = Int.random(in: 1...100)
        if randomInt % 2 == 0 {
            currentPlayer = player1
            notCurrentPlayer = player2
        }else{
            currentPlayer = player2
            notCurrentPlayer = player1
        }
        
    }
    
    
    
    
    
    func makeAMove(position: Int) -> Bool {
        if board[position] == 0 {
            board[position] = currentPlayer.nr
            currentPlayer.positionsOwned.append(position)
            return true
        }else{
            return false
        }
        
    }
    
    func makeAIMove() {
        let position = currentPlayer.makeAMove(board: board, turn: currentTurn)
        if board[position] == 0 {
            board[position] = currentPlayer.nr
            currentPlayer.positionsOwned.append(position)
        }
    }
    
    func checkForWin() -> Bool {
        
        
        let cPNr = currentPlayer.nr
        if  board[0] == cPNr && board[1] == cPNr && board[2] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[3] == cPNr && board[4] == cPNr && board[5] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[6] == cPNr && board[7] == cPNr && board[8] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[0] == cPNr && board[3] == cPNr && board[6] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[1] == cPNr && board[4] == cPNr && board[7] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[2] == cPNr && board[5] == cPNr && board[8] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[0] == cPNr && board[4] == cPNr && board[8] == cPNr {
            win = true
            currentPlayer.wins += 1
        }else if board[2] == cPNr && board[4] == cPNr && board[6] == cPNr {
            win = true
            currentPlayer.wins += 1
        }
        
        if win == true {
            return true
        }else{
            return false
        }
        
        
    }
    
    func checkForDraw() -> Bool {
        if currentTurn == 9{
            player1.draws += 1
            player2.draws += 1
        return true
        }else{
            return false
        }
        
    }
    
    func nextPlayer() {
        currentTurn += 1
        if currentPlayer.nr == 1 {
            currentPlayer = player2
            notCurrentPlayer = player1
            
        }else{
            currentPlayer = player1
            notCurrentPlayer = player2
            
        }
    }
    
    
    
    func isCurrent(player: Player) -> Bool {
        if player.nr == currentPlayer.nr {
            return true
        }else{
            return false
        }
    }
    
    
    
    
    
}
