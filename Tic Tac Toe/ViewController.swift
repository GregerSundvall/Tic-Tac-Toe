//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var p1Background: UIView!
    @IBOutlet weak var p1Label: UILabel!
    @IBOutlet weak var p1Name: UILabel!
    @IBOutlet weak var p1Wins: UILabel!
    @IBOutlet weak var p2Background: UIView!
    @IBOutlet weak var p2Label: UILabel!
    @IBOutlet weak var p2Name: UILabel!
    @IBOutlet weak var p2Wins: UILabel!
    
    var game = Game()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        p2Background.transform = p2Background.transform.rotated(by: .pi)
        
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
            sender.backgroundColor = getPlayerColor(player: game.currentPlayer)
            
            if game.checkForWin() == true {
                p1Label.font = UIFont.systemFont(ofSize: 40.0)
                p2Label.font = UIFont.systemFont(ofSize: 40.0)
                p1Label.text = "\(game.currentPlayer.name) won!"
                p2Label.text = "\(game.currentPlayer.name) won!"
                disableButtons()
                
            }else if game.checkForDraw() == true{
                p1Label.font = UIFont.systemFont(ofSize: 40.0)
                p2Label.font = UIFont.systemFont(ofSize: 40.0)
                p1Label.text = "Draw!"
                p2Label.text = "Draw!"
                
            }else{
                game.nextPlayer()
                setLabels()
            }
        }
    }
    
    
    func disableButtons() {
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
        button1.isUserInteractionEnabled = false
    }
    
    
    func setLabels() {
        p1Background.backgroundColor = getPlayerColor(player: game.player1)
        p1Name.text = game.player1.name
        p1Wins.text = "\(game.player1.wins) wins"
        
        p2Background.backgroundColor = getPlayerColor(player: game.player2)
        p2Name.text = game.player2.name
        p2Wins.text = "\(game.player2.wins) wins"
        
        if game.player1.nr == game.currentPlayer.nr {
            p1Label.font = UIFont.systemFont(ofSize: 40.0)
            p1Label.text = "Your turn!"
            p2Label.font = UIFont.systemFont(ofSize: 20.0)
            p2Label.text = "Please wait for other player"
        }else{
            p1Label.font = UIFont.systemFont(ofSize: 20.0)
            p1Label.text = "Please wait for other player"
            p2Label.font = UIFont.systemFont(ofSize: 40.0)
            p2Label.text = "Your turn!"
        }
    }
    
    
    func getPlayerColor(player: Player) -> UIColor {
        let color = UIColor(red: CGFloat(player.color[0]),
                            green: CGFloat(player.color[1]),
                            blue: CGFloat(player.color[2]),
                            alpha: CGFloat(player.color[3]))
        return color
    }
    
    
    
}

