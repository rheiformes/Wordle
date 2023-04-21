//
//  ConfettiVC.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/21/23.
//

import UIKit

class ConfettiVC: UIViewController {

    var color: CGColor = UIColor.systemGreen.cgColor
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLayer()
    }
    

    func createLayer() {
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x, y: view.center.y)
        let cell = CAEmitterCell()
        cell.scale = 0.05
        cell.emissionRange = .pi * 2
        cell.lifetime = 5
        cell.birthRate = 100
        cell.velocity = 500
        cell.xAcceleration = -100
        cell.yAcceleration = -100
        cell.zAcceleration = -100
        cell.color = self.color
        cell.contents = UIImage(named: "confetti")!.cgImage
        
        layer.emitterCells = [cell]
        
        view.layer.addSublayer(layer)
    }

}
