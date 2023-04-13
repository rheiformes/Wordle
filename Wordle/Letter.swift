//
//  Letter.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/13/23.
//

import Foundation

enum LetterTypes {
    case correct
    case misplaced
    case incorrect
    case empty
}


class Letter {
    var letter: String = ""
    var wordIndex: Int = 0
    var letterIndex: Int = 0
    var type = LetterTypes.empty
    
    func assignTypeFrom(key: String) {
        if letter.count != 1 {
            type = LetterTypes.empty
        }
            //TODO: figure this entie thing out
        if key.contains(letter) {
            if key[key.index(letterIndex, offsetBy: 0)] == letter {
                type = LetterTypes.correct
            }
            else {
                type = LetterTypes.misplaced
            }
        }
        else {
            type = LetterTypes.incorrect
        }
        
        
    }
}
