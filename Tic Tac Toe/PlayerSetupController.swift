//
//  PlayerSetup.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-21.
//

import UIKit

class PlayerSetupController: UIViewController, UIColorPickerViewControllerDelegate {
    
    
    @IBOutlet weak var p2Background: UIView!
    @IBOutlet weak var p2Name: UITextField!
    @IBOutlet weak var p2Selector: UISegmentedControl!
    @IBOutlet weak var p2ColorButton: UIButton!
    
    @IBOutlet weak var p1Background: UIView!
    @IBOutlet weak var p1Name: UITextField!
    @IBOutlet weak var p1Selector: UISegmentedControl!
    @IBOutlet weak var p1ColorButton: UIButton!
    
    var whoOpenedColorPicker = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p1ColorButton.layer.cornerRadius = 5
        p2ColorButton.layer.cornerRadius = 5
        
        
        
    }
    
    
    
    @IBAction func p2ColorButton(_ sender: UIButton) {
        whoOpenedColorPicker = 2
        showColorPicker(sender: sender)
    }
    
    @IBAction func p1ColorButton(_ sender: UIButton) {
        whoOpenedColorPicker = 1
        showColorPicker(sender: sender)
    }
    
    func showColorPicker(sender: UIButton) {
        var currentColor = UIColor.black
        if sender == p1ColorButton {
            currentColor = p1Background.backgroundColor ?? .black
        }else if sender == p2ColorButton {
            currentColor = p2Background.backgroundColor ?? .black
        }
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = currentColor
        colorPicker.title = "Select color"
        colorPicker.supportsAlpha = false
        present(colorPicker, animated: true, completion: nil)
    }
    
    
    @IBAction func startGameButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueSetupToGame", sender: self)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSetupToGame"{
            let destinationVC = segue.destination as! ViewController
            
            destinationVC.recievedP1Name = p1Name.text ?? "Player 1"
            destinationVC.recievedP1Color = p1Background.backgroundColor
            if p1Selector.selectedSegmentIndex == 0 {
            destinationVC.recievedP1Ai = false
            }else{
                destinationVC.recievedP1Ai = true
            }
            
            destinationVC.recievedP2Name = p2Name.text ?? "Player 2"
            destinationVC.recievedP2Color = p2Background.backgroundColor
            if p2Selector.selectedSegmentIndex == 0 {
            destinationVC.recievedP2Ai = false
            }else{
                destinationVC.recievedP2Ai = true
            }
        }
    }
    
    @IBAction func unwindToSetupView(segue: UIStoryboardSegue)
    {}
    
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        if whoOpenedColorPicker == 1 {
            p1Background.backgroundColor = viewController.selectedColor
        }else if whoOpenedColorPicker == 2 {
            p2Background.backgroundColor = viewController.selectedColor
        }
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        //view controller closed
    }
    
}
   
    

