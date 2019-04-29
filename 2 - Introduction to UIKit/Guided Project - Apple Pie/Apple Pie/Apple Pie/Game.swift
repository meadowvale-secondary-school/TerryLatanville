//
//  Game.swift
//  Apple Pie
//
//  Created by Terry Latanville on 2019-04-29.
//  Copyright © 2019 Terry Latanville. All rights reserved.
//

struct Game {
    enum State {
        case won, lost, active
    }
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        return word.reduce("") { guessedWord, letter in
            return guessedWord + (guessedLetters.contains(letter) ? "\(letter)" : "_")
        }
    }
    var state: State {
        if incorrectMovesRemaining <= 0 {
            return .lost
        } else if formattedWord == word {
            return .won
        } else {
            return .active
        }
    }

    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
