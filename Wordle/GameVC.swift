//
//  ViewController.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/3/23.
//

import UIKit


class GameVC: UIViewController {

    var game:Wordle = Wordle()

    //var rowHolder : UIStackView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.game = Wordle()
    }
    
    func resetView() {
        self.game = Wordle()
    }
    
    
    
    
    

    //TODO: make this an ibaction
    func userEnteredGuess(userWord: String) {
        validateGuess(userWord: userWord)
        
        if game.isSolved { endGame(solved: true)}
        else if game.numGuesses == game.maxGuessesAllowed { endGame(solved: false)}
        else { prepareNewGuess() }
    }
        
    func validateGuess(userWord: String) {

        if ((game.dictionary.isValid(phrase: userWord)) && (userWord.count == game.maxLetterLength)) {
            addGuess(userWord: userWord)
        }
        else { /* TODO: shake field */   }
        
        //TODO: clear feild
    }

    func addGuess(userWord: String) {
        if (userWord == game.key) { game.isSolved = true }
    }
    func prepareNewGuess() {
        //clear field
        //choose next row
    }
    func endGame(solved: Bool) {
        //pull up new screen depending on wordle is solved or not
    }
    
    
    
    
    

}

