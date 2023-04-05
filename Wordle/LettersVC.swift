//
//  LettersVC.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/5/23.
//

import UIKit

class LettersVC: UILabel {

    //source: https://stackoverflow.com/questions/33325919/uilabel-subclass-initialize-with-custom-color
    
    required init(coder codable: NSCoder) {
        super.init(coder: codable)!
        self.commonInit()
    }
    override init(frame: CGRect) {
        
    }
    func commonInt() {
        
    }

}
