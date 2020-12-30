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
    @IBOutlet weak var startGameButton: UIButton!
    
    var whoOpenedColorPicker = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p2Selector.selectedSegmentIndex = 1
        p2Name.text = "AI"
        
        hideKeyboardOnTap()
        
        p1Name.autocapitalizationType = .words
        p2Name.autocapitalizationType = .words
        p1ColorButton.layer.cornerRadius = 5
        p2ColorButton.layer.cornerRadius = 5
        startGameButton.layer.cornerRadius = 5
        
        
        
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
            
            
            if let p1NameString = p1Name.text {
                p1Name.text = p1NameString
                if p1NameString.count == 0{
                    p1Name.text = "Player one"
                }
                destinationVC.recievedP1Name = p1Name.text!
            }
            
            if let p2NameString = p2Name.text {
                p2Name.text = p2NameString
                if p2NameString.count == 0{
                    p2Name.text = "Player two"
                }
                destinationVC.recievedP2Name = p2Name.text!
            }
            
            destinationVC.recievedP1Color = p1Background.backgroundColor!
            if p1Selector.selectedSegmentIndex == 0 {
            destinationVC.recievedP1Ai = false
            }else{
                p1Name.text = "AI"
                destinationVC.recievedP1Ai = true
            }
            
            destinationVC.recievedP2Color = p2Background.backgroundColor!
            if p2Selector.selectedSegmentIndex == 0 {
            destinationVC.recievedP2Ai = false
            }else{
                p2Name.text = "AI"
                destinationVC.recievedP2Ai = true
            }
        }
    }
    
    @IBAction func unwindToSetupView(segue: UIStoryboardSegue) {
        p1Name.text = ""
        p2Name.text = ""
    }
    
    
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
   
extension UIViewController {
    func hideKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
    

