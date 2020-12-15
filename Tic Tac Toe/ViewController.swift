//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Greger Sundvall on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {

    var listOfPositions = [Int]()
    var currentPlayer = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        for _ in 1...9 {
            listOfPositions.append(0)
        }
        print(listOfPositions)
        
        
        
        listOfPositions[5] = 1
        
        print(listOfPositions)
        
    }
    
    


}

