//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Ксения Загарьева on 02.12.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDefinition: UILabel!
    
    var results: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        getResult()
    }
}

private extension ResultViewController {
    func updateUI() {
        title = "Ваш результат"
        navigationItem.hidesBackButton = true
    }
    
    func getResult() {
        var frequencyOfAnswers: [Animal: Int] = [:]
        let answers = results.map { $0.animal }
        
        for answer in answers {
            frequencyOfAnswers[answer, default: 0] += 1
        }
        
        let sortedFrequencyOfAnswers = frequencyOfAnswers.sorted { $0.value > $1.value }
        guard let mostFrequentAnswer = sortedFrequencyOfAnswers.first?.key else { return }
        
        updateUI(with: mostFrequentAnswer)
    }
    
    func updateUI(with animal: Animal) {
        resultLabel.text = "Вы - \(animal.rawValue)"
        resultDefinition.text = "\(animal.definition)"
    }
}

