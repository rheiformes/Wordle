//
//  ViewController.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/3/23.
//

import UIKit


class GameVC: UIViewController, UITextFieldDelegate {

    var game:Wordle = Wordle()

    @IBOutlet var guessField: TextFieldVC!
    @IBOutlet var grid: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessField.delegate = self
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
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        let word = textField.text ?? ""
        //print("guess: \(word)")
        userEnteredGuess(userWord: word)
        
        return true
    }
    
    
    func userEnteredGuess(userWord: String) {
        validateGuess(userWord: userWord)
        
        if game.isSolved { endGame(solved: true)}
        else if game.numGuesses == game.maxGuessesAllowed { endGame(solved: false)}
    }
        
    func validateGuess(userWord: String) {
//        print("got to validate")
//        print(userWord.count)
//        print(game.maxLetterLength)
//        print(game.dictionary.isValid(phrase: "ABODE"))
        if ((game.dictionary.isValid(phrase: userWord.uppercased())) && (userWord.count == game.maxLetterLength)) {
            print("word \(userWord) is valid")
            addGuess(userWord: userWord)
        }
        else { self.guessField.shake()   }
        self.guessField.text = ""
    }

    func addGuess(userWord: String) {
        print("got here")
        game.numGuesses += 1
        let thisRow = game.numGuesses - 1 // for the two extra labels/field
        //print(thisRow)
        if (userWord == game.key) { game.isSolved = true }
        
        
        let row = (grid.arrangedSubviews[thisRow + 2] as! UIStackView).arrangedSubviews as! [LetterVC] //??

        for letter in row {
            letter.updateView(withGuess: userWord) //FIXME: now this doesn't work, plus the dicitonary doesn't have all words?
            print("updated")
        }
        
    }

    
    func endGame(solved: Bool) {
        //pull up new screen depending on wordle is solved or not
    }
    
    
    
    
    

}

