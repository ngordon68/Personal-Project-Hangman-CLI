//
//  main.swift
//  Hangman CLI
//
//  Created by Nick Gordon on 7/17/24.
//


//get index if there are duplicate letters


/*
 user make a guess
 if guess is correct
 loop through word and place characters
 if wrong, increase counter
 */
import Foundation



var listOfWords = ["pizza"]
var currentWord = listOfWords.randomElement()!
var currentWordInArray = Array(currentWord).map {String($0) }
var guessedWordCount = currentWord.count
var guessedWord = String(repeating: "_", count: guessedWordCount)
var guessedWordArray = guessedWord.map {String($0) }
var attempts = 0


fileprivate func placeLetter(_ userInput: String) {
    print("You have guessed \(userInput) which is correct!")
    for index in currentWordInArray.indices {
        if currentWordInArray[index] == userInput {
            guessedWordArray[index] = userInput
            guessedWord = guessedWordArray.joined()
            
        }
    }
    print(guessedWord)
}
fileprivate func generateHangman() {
    switch attempts {
    case 1:
        print(" +---+")
        print(" 0   | ")
        print("     | ")
        print("     | ")
        print("     | ")
    case 2:
        print(" +---+")
        print(" 0   | ")
        print(" |   | ")
        print("     | ")
        print("     | ")
    case 3:
        print(" +---+")
        print(" O   | ")
        print("/|   | ")
        print("     | ")
        print("     | ")
    case 4:
        print(" +---+")
        print(" O   | ")
        print("/|\\  | ")
        print("     | ")
        print("     | ")
    case 5:
        print(" +---+")
        print(" O   | ")
        print("/|\\  | ")
        print("/    | ")
        print("     | ")
    default:
        print(" +---+")
        print(" O   | ")
        print("/|\\  | ")
        print("/ \\  | ")
        print("     | ")
    }
}

func playGame() {
    
    while attempts <= 5 {
        print("Guess a letter!")
        guard let userInput = readLine() else { return  print("please try again") }
        
        if currentWord.contains(userInput) {
            placeLetter(userInput)
            if currentWord == guessedWord {
                print("YOU WIN")
            }
        } else {
            print("You have guessed \(userInput) which is incorrect")
            print("Please try again")
            attempts += 1
            generateHangman()
            
        }
    }
    print("You LOSE!")
}

playGame()
