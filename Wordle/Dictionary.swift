//
//  Dictionary.swift
//  Wordle
//
//  Created by Rai, Rhea on 4/5/23.
//

/**
  **REQUIRED FILES**
 dictionary.txt
 
 */

import Foundation

class Dictionary {
    private var dictionary: [String] = []
    
    /**
     imports the dictionary words from file
     */
    init() {
        loadFile(name: "dictionary")
    }
    
    //this shouldn't be messed with outside the init
    private func loadFile(name : String) {
        //load file
        guard let file = Bundle.main.url(forResource: name, withExtension: "txt") else {
            fatalError("can't find \(name)")
        }
        
        //split into the dicitonary
        do {
            let fileContents = try String(contentsOf: file, encoding: String.Encoding.utf8)
            dictionary = fileContents.components(separatedBy: "\n")
        } catch {
            fatalError("can't parse \(name)")
        }
    }
    
    
    /**
     checks if a 'word' is valid in the dictionary
     */
    func isValid(phrase : String) -> Bool {
        return dictionary.contains(phrase)
    }
    
    /**
     returns a random word from dictionary
     */
    func random() -> String {
        return dictionary[Int.random(in: 0..<dictionary.count)]
    }
    
    

}
