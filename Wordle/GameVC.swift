//
//  ViewController.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/3/23.
//

import UIKit

class GameVC: UIViewController {

    var game:Wordle = Wordle()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.game = Wordle()
    }
    
    func resetView() {
        self.game = Wordle()
    }
    
    
    
    
    
    

}

