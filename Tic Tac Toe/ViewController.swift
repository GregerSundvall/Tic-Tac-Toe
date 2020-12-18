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
    @IBOutlet weak var p1PlayAgain: UIButton!
    @IBOutlet weak var p1Draws: UILabel!
    @IBOutlet weak var p2Background: UIView!
    @IBOutlet weak var p2Label: UILabel!
    @IBOutlet weak var p2Name: UILabel!
    @IBOutlet weak var p2Wins: UILabel!
    @IBOutlet weak var p2PlayAgain: UIButton!
    @IBOutlet weak var p2Draws: UILabel!
    
    var game = Game()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        p1PlayAgain.layer.cornerRadius = 8
        p2PlayAgain.layer.cornerRadius = 8
        p2Background.transform = p2Background.transform.rotated(by: .pi)
        
        
        setLabels()
        
    }
    
    func anotherRound() {
        game.anotherRound()
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
            sender.isEnabled = false
            sender.backgroundColor = getPlayerColor(player: game.currentPlayer)
            
            if game.checkForWin() == true {
                p1Label.text = "\(game.currentPlayer.name) won!"
                p2Label.text = "\(game.currentPlayer.name) won!"
                p1Wins.text = "\(game.player1.wins) wins"
                p2Wins.text = "\(game.player2.wins) wins"
                p1PlayAgain.isHidden = false
                p2PlayAgain.isHidden = false
                disableButtons()
                
            }else if game.checkForDraw() == true{
                p1Label.text = "Draw!"
                p2Label.text = "Draw!"
                p1PlayAgain.isHidden = false
                p2PlayAgain.isHidden = false
                p1Draws.text = "\(game.player1.draws) Draws"
                p2Draws.text = "\(game.player2.draws) Draws"
                disableButtons()
                
            }else{
                game.nextPlayer()
                setLabels()
            }
        }
    }
    
    
    
    
    func disableButtons() {
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
    }
    
    func resetButtons() {
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        button5.isEnabled = true
        button6.isEnabled = true
        button7.isEnabled = true
        button8.isEnabled = true
        button9.isEnabled = true
        
        button1.backgroundColor = UIColor.systemGray5
        button2.backgroundColor = UIColor.systemGray5
        button3.backgroundColor = UIColor.systemGray5
        button4.backgroundColor = UIColor.systemGray5
        button5.backgroundColor = UIColor.systemGray5
        button6.backgroundColor = UIColor.systemGray5
        button7.backgroundColor = UIColor.systemGray5
        button8.backgroundColor = UIColor.systemGray5
        button9.backgroundColor = UIColor.systemGray5
    }
    
    
    func setLabels() {
        p1Background.backgroundColor = getPlayerColor(player: game.player1)
        p1Name.text = game.player1.name
        p1Wins.text = "\(game.player1.wins) wins"
        p1Draws.text = "\(game.player1.draws) Draws"
        p1PlayAgain.setTitleColor(getPlayerColor(player: game.player1), for: UIControl.State.normal)
        
        p2Background.backgroundColor = getPlayerColor(player: game.player2)
        p2Name.text = game.player2.name
        p2Wins.text = "\(game.player2.wins) wins"
        p2Draws.text = "\(game.player2.draws) Draws"
        p2PlayAgain.setTitleColor(getPlayerColor(player: game.player2), for: UIControl.State.normal)
        if game.player1.nr == game.currentPlayer.nr {
            p1Label.text = "Your turn!"
            p2Label.text = "Opponent's turn"
        }else{
            p1Label.text = "Opponent's turn"
            p2Label.text = "Your turn!"
        }
        
        if game.win == false {
            p1PlayAgain.isHidden = true
            p2PlayAgain.isHidden = true
        }else{
            p1PlayAgain.isHidden = false
            p2PlayAgain.isHidden = false
        }
        
    }
    
    
    func getPlayerColor(player: Player) -> UIColor {
        let color = UIColor(red: CGFloat(player.color[0]),
                            green: CGFloat(player.color[1]),
                            blue: CGFloat(player.color[2]),
                            alpha: CGFloat(player.color[3]))
        return color
    }
    
    
    @IBAction func playAgainPressed(_ sender: Any) {
        if game.playAgain == 0 {
            game.playAgain += 1
        }else if game.playAgain == 1 {
            game.anotherRound()
            resetButtons()
            setLabels()
        }
        
    }
    
}

