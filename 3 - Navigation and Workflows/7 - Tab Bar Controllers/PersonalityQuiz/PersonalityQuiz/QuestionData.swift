//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Terry Latanville on 2019-05-28.
//  Copyright © 2019 Terry Latanville. All rights reserved.
//

struct Question {
    enum Response {
        case single, multiple, range
    }
    let text: String
    let type: Response
    let answers: [Answer]
}

struct Answer {
    enum Animal: Character {
        case dog = "🐶"
        case cat = "🐱"
        case rabbit = "🐰"
        case turtle = "🐢"

        var definition: String {
            switch self {
            case .dog:
                return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
            case .cat:
                return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
            case .rabbit:
                return "You love everything that's soft. You are healthy and full of energy."
            case .turtle:
                return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
            }
        }
    }
    let text: String
    let animal: Animal
}
