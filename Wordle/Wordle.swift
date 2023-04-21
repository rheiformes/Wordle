//
//  Wordle.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/5/23


import Foundation
class Wordle {
    var key : String
    var numGuesses : Int = 0
    var isSolved : Bool = false
    let maxGuessesAllowed: Int = 6
    let maxLetterLength = 5
    
    let dictionary = Dictionary()
    
    //for testing; allows to select a word
    init(correctWord: String) {
        self.key = correctWord
    }
    
    //for running; generates a random word
    /** this class generates a wordle game, including a key */
    init() {
        self.key = self.dictionary.random()
    }
    
    
}
