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
        var frequentAnswers: [Animal: Int] = [:]
        
        let resultType = results.map { $0.animal }
        
        for result in resultType {
            frequentAnswers[result] = (frequentAnswers[result] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequentAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultLabel.text = "Вы - \(mostCommonAnswer.rawValue)"
        resultDefinition.text = "\(mostCommonAnswer.definition)"
    }
}
