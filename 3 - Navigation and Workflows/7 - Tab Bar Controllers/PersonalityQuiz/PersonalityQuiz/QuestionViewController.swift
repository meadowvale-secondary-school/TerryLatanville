//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Terry Latanville on 2019-05-07.
//  Copyright © 2019 Terry Latanville. All rights reserved.
//

import UIKit

final class QuestionViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!

    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeSlider: UISlider!
    @IBOutlet var rangeLabels: [UILabel]!

    // MARK: - Properties
    private var questionIndex = 0
    private let questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", animal: .dog),
                    Answer(text: "Fish", animal: .cat),
                    Answer(text: "Carrots", animal: .rabbit),
                    Answer(text: "Corn", animal: .turtle)
        ]),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", animal: .turtle),
                    Answer(text: "Sleeping", animal: .cat),
                    Answer(text: "Cuddling", animal: .rabbit),
                    Answer(text: "Eating", animal: .dog),
        ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .range,
                 answers: [
                    Answer(text: "I dislike them", animal: .cat),
                    Answer(text: "I get a little nervous", animal: .rabbit),
                    Answer(text: "I barely notice them", animal: .turtle),
                    Answer(text: "I love them", animal: .dog)
            ])
    ]
    private var answers: [Answer] = []

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "ResultsSegue" else { return }
        let resultsViewController = segue.destination as! ResultsViewController
        resultsViewController.responses = answers
    }

    // MARK: - Functions
    private func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true

        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)

        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)

        switch currentQuestion.type {
        case .single:
            updateSingleStack(with: currentAnswers)
        case .multiple:
            updateMultipleStack(with: currentAnswers)
        case .range:
            updateRangeStack(with: currentAnswers)
        }
    }

    private func updateSingleStack(with answers: [Answer]) {
        precondition(answers.count >= singleButtons.count)
        for (index, button) in singleButtons.enumerated() {
            button.setTitle(answers[index].text, for: .normal)
        }
        singleStackView.isHidden = false
    }

    private func updateMultipleStack(with answers: [Answer]) {
        precondition(answers.count >= multiLabels.count)
        for (index, label) in multiLabels.enumerated() {
            label.text = answers[index].text
            multiSwitches[index].isOn = false
        }
        multipleStackView.isHidden = false
    }

    private func updateRangeStack(with answers: [Answer]) {
        precondition(answers.count >= rangeLabels.count)
        rangeSlider.setValue(0.5, animated: false)
        rangeLabels.first?.text = answers.first?.text
        rangeLabels.last?.text = answers.last?.text
        rangeStackView.isHidden = false
    }

    private func nextQuestion() {
        questionIndex += 1
        guard questionIndex < questions.count else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
            return
        }
        updateUI()
    }

    // MARK: - IBActions
    @IBAction func singleAnswerSelected(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let index = singleButtons.firstIndex(of: sender),
            index < currentAnswers.count else {
            print("That wasn't an option!")
            return
        }
        answers.append(currentAnswers[index])
        nextQuestion()
    }

    @IBAction func multiAnswerSelected(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        multiSwitches.enumerated().forEach { index, swtch in
            guard swtch.isOn else { return }
            answers.append(currentAnswers[index])
        }
        nextQuestion()
    }

    @IBAction func rangeAnswerSelected(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        answers.append(currentAnswers[index])
        nextQuestion()
    }
}

