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
    
    
    var game = Game()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        labelp2.transform = labelp2.transform.rotated(by: .pi)
        
        

        setLabels()
        
        
        
        
    }
    

    


    
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        var position = 10
        
        switch sender {
        case button1:
            position = 0
        case button2:
            position = 1
        case button3:
            position = 2
        case button4:
            position = 3
        case button5:
            position = 4
        case button6:
            position = 5
        case button7:
            position = 6
        case button8:
            position = 7
        case button9:
            position = 8
        default:
            do {}
        }
        
        
        if game.makeAMove(position: position) == true {
            sender.alpha = 0.7
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                sender.alpha = 1
            }
            sender.isUserInteractionEnabled = false
            sender.backgroundColor = getPlayerColor()
            
            if game.checkForWin() == true {
                labelp1.text = "\(game.currentPlayer.name) won!"
                labelp2.text = "\(game.currentPlayer.name) won!"
                
            }else if game.checkForDraw() == true{
                labelp1.text = "Draw!"
                labelp2.text = "Draw!"
                
            }else{
                game.nextPlayer()
                setLabels()
            }
            
            
        }
    
    }
    
    
    func setLabels() {
        if game.player1.nr == game.currentPlayer.nr {
            labelp1.text = "Your turn!"
        }else{
            labelp1.text = game.player1.name
        }
        
        if game.player2.nr == game.currentPlayer.nr {
            labelp2.text = "Your turn!"
        }else{
            labelp2.text = game.player2.name
        }
        
    }
    
    
    func getPlayerColor() -> UIColor {
        let player = game.currentPlayer
        let color = UIColor(red: CGFloat(player.color[0]),
                            green: CGFloat(player.color[1]),
                            blue: CGFloat(player.color[2]),
                            alpha: CGFloat(player.color[3]))
        return color
    }
    
    
    
}

