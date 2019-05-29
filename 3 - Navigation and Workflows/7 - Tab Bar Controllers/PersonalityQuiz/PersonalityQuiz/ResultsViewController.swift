//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Terry Latanville on 2019-05-28.
//  Copyright © 2019 Terry Latanville. All rights reserved.
//

import UIKit

final class ResultsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!

    // MARK: - Properties
    var responses: [Answer]!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }

    // MARK: - Functions
    private func calculatePersonalityResult() {
        let mostCommonAnswer = responses.reduce(into: [Answer.Animal: Int]()) { result, answer in
            return result[answer.animal, default: 0] += 1
        }.sorted { pair1, pair2 in
            return pair1.value > pair2.value
        }.first
        guard let animal = mostCommonAnswer?.key else {
            print("Something went wrong!")
            return
        }
        resultAnswerLabel.text = "You are a \(animal.rawValue)!"
        resultDefinitionLabel.text = animal.definition
    }
}
