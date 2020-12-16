//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelp1: UILabel!
    @IBOutlet weak var labelp2: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    var positions = [Int]()
    var currentPlayer = 1
    var win = false
    var currentRound = 1
    var color1 : UIColor = UIColor(red: 0.0, green: 0.3, blue: 0.4, alpha: 1.0)
    var color2 : UIColor = UIColor(red: 0.4, green: 0.0, blue: 0.2, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        labelp2.transform = labelp2.transform.rotated(by: .pi)
        
        for _ in 1...9 {
            positions.append(0)
        }

        labelp1.text = "Your turn"
        labelp2.text = "Player 2"
        
        
    }
    
    func getColor() -> UIColor {
        if currentPlayer == 1 {
            return color1
            
        }else{
            return color2
            
        }
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
        let cp = currentPlayer
        if  positions[0] == cp && positions[1] == cp && positions[2] == cp {
            win = true
        }else if positions[3] == cp && positions[4] == cp && positions[5] == cp {
            win = true
        }else if positions[6] == cp && positions[7] == cp && positions[8] == cp {
            win = true
        }else if positions[0] == cp && positions[3] == cp && positions[6] == cp {
            win = true
        }else if positions[1] == cp && positions[4] == cp && positions[7] == cp {
            win = true
        }else if positions[2] == cp && positions[5] == cp && positions[8] == cp {
            win = true
        }else if positions[0] == cp && positions[4] == cp && positions[8] == cp {
            win = true
        }else if positions[2] == cp && positions[4] == cp && positions[6] == cp {
            win = true
        }
        
        if win == false && currentRound < 9 {
            nextPlayer()
        }else if win == false && currentRound == 9{
            print("No winner")
        
        }else{
            gameWon()
        }
    }

    
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        sender.alpha = 0.7
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1
        }
        
        switch sender {
        case button1:
            positions[0] = currentPlayer
        case button2:
            positions[1] = currentPlayer
        case button3:
            positions[2] = currentPlayer
        case button4:
            positions[3] = currentPlayer
        case button5:
            positions[4] = currentPlayer
        case button6:
            positions[5] = currentPlayer
        case button7:
            positions[6] = currentPlayer
        case button8:
            positions[7] = currentPlayer
        case button9:
            positions[8] = currentPlayer
        default:
            do {}
        }
        
        
        
        sender.isUserInteractionEnabled = false
        sender.backgroundColor = getColor()
        checkForWin()
    
    }
    
    
    
}

