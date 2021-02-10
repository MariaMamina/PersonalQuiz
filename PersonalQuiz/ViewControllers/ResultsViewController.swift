//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultSmileLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    // Передать сюда массив с ответами
    // Определить наиболее часто встречающийся тип животного
    // Отобразить результат в соответсвии с этим животным.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        findResult()
    }
    
    private func findResult() {
        
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        guard let answersChoosen = self.answersChoosen else { return }
        
        for answerChoosen in answersChoosen {
            switch answerChoosen.type{
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        
        let resultDictionary: Dictionary <AnimalType, Int> =
            [.dog:dogCount,
             .cat:catCount,
             .rabbit:rabbitCount,
             .turtle:turtleCount]
        
        let result = resultDictionary.sorted { $0.value > $1.value }.first
        if let result = result {
            definitionLabel.text = result.key.definition
            resultSmileLabel.text = "ВЫ - \(result.key.rawValue)"
        }
    }
    
}
