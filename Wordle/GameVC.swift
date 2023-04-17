//
//  ViewController.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/3/23.
//

import UIKit


class GameVC: UIViewController {

    var game:Wordle = Wordle()

    @IBOutlet var guessField: TextFieldVC!
    @IBOutlet var grid: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView()
    }
    
    func resetView() {
        self.game = Wordle()
        print(self.game.key)
        /*
         source for accessing stacks: https://stackoverflow.com/questions/54836696/looping-through-nested-stacks-in-swift
         */
        var x = 0
        for case let hStack as UIStackView in grid.subviews {
            hStack.tag = x
            var y = 0
            for case let letterLbl as LetterVC in hStack.arrangedSubviews {
                letterLbl.letter.letter = ""
                letterLbl.letter.type = .empty
                letterLbl.letter.letterIndex = y
                letterLbl.updateView()
                y+=1
            }
            x+=1
        }
    }
    

    //TODO: make this an ibaction
    func userEnteredGuess(userWord: String) {
        validateGuess(userWord: userWord)
        
        if game.isSolved { endGame(solved: true)}
        else if game.numGuesses == game.maxGuessesAllowed { endGame(solved: false)}
    }
        
    func validateGuess(userWord: String) {

        if ((game.dictionary.isValid(phrase: userWord)) && (userWord.count == game.maxLetterLength)) {
            addGuess(userWord: userWord)
        }
        else { self.guessField.shake()   }
        self.guessField.text = ""
    }

    func addGuess(userWord: String) {
        game.numGuesses += 1
        let thisRow = game.numGuesses - 1
        if (userWord == game.key) { game.isSolved = true }
        
        //TODO: this inputs the guess. needs to be checked for correct letters
        
    }

    
    func endGame(solved: Bool) {
        //pull up new screen depending on wordle is solved or not
    }
    
    
    
    
    

}

