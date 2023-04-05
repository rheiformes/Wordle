//
//  Wordle.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/5/23.
//

import Foundation
class Wordle {
    var key : String
    var guesses : [String] = []
    var isSolved : Bool = false
    var maxGuessesAllowed: Int = 6
    
    init(correctWord: String) {
        self.key = correctWord
    }
    
    
    
}
