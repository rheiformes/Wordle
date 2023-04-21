//
//  LetterVC.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/17/23.
//

import UIKit

class LetterVC: UILabel {

    var letter: Letter = Letter()
    
    func updateView(withGuess: String, key: String) {
        self.letter.setLetterValue(guess: withGuess)
        letter.assignTypeFrom(key: key)
        updateView()        
    }
    
    func updateView() {
        self.text = self.letter.letter
        switch self.letter.type {
        case .empty:
            self.backgroundColor = .systemGray2
        case .misplaced:
            self.backgroundColor = .systemYellow
        case .incorrect:
            self.backgroundColor = .systemRed
        case .correct:
            self.backgroundColor = .systemGreen
        }
    }
    

}
