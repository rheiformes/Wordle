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
        self.guessField.isEnabled = true
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
        if (userWord == game.key) { game.isSolved = true }
        
        
        let row = (grid.arrangedSubviews[thisRow + 2] as! UIStackView).arrangedSubviews as! [LetterVC] //??

        for letter in row {
            letter.updateView(withGuess: userWord, key: game.key)
            print("updated")
        }
        
    }

    
    @IBAction func goToHelp(_ sender: Any) {
        performSegue(withIdentifier: "toHelp", sender: self)
    }
    
    @IBAction func goToSettings(_ sender: Any) {
        performSegue(withIdentifier: "toSettings", sender: self)
    }
    func endGame(solved: Bool) {
        self.guessField.isEnabled = false
        if solved {
            performSegue(withIdentifier: "won", sender: self)
        }
        else {
            performSegue(withIdentifier: "lost", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "won") {
            if let confettiVC = segue.destination as? ConfettiVC {
                confettiVC.color = UIColor.systemGreen.cgColor
            }
        }
        if(segue.identifier == "lost") {
            if let confettiVC = segue.destination as? ConfettiVC {
                confettiVC.color = UIColor.systemRed.cgColor
            }
        }
    }
    
    
    
    
    

}

