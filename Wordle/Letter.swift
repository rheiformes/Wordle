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
            //why is subscripting so weird in swift?? https://www.simpleswiftguide.com/get-character-from-string-using-its-index-in-swift/
            
            let keyLetter = String(key[key.index(key.startIndex, offsetBy: letterIndex)])
            if keyLetter == letter {
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
