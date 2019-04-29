//
//  ViewController.swift
//  Apple Pie
//
//  Created by Terry Latanville on 2019-04-29.
//  Copyright © 2019 Terry Latanville. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    // MARK: - Properties
    private var listOfWords = [
        "buccaneer",
        "swift",
        "glorious",
        "incandescent",
        "bug",
        "program"
    ]
    private let incorrectMovesAllowed = 7
    private var totalWins = 0 {
        didSet { newRound() }
    }
    private var totalLosses = 0 {
        didSet { newRound() }
    }
    private var currentGame: Game!

    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRound()
    }

    // MARK: - Game Lifecycle Functions
    private func newRound() {
        guard !listOfWords.isEmpty else {
            letterButtons.forEach { $0.isEnabled = false }
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        letterButtons.forEach { $0.isEnabled = true }
        updateUI()
    }

    private func updateUI() {
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        correctWordLabel.text = currentGame.formattedWord.reduce("") { result, letter in result + "\(letter) " }
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    }

    private func updateGameState() {
        switch currentGame.state {
        case .won:
            totalWins += 1
        case .lost:
            totalLosses += 1

        default:
            updateUI()
        }
    }

    // MARK: - IBActions
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }

}

