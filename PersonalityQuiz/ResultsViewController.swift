//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Riad on 2/13/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet var resultsAnswerLabel: UILabel!
    @IBOutlet var resultsDefinitionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    var responses: [Answer]!
    
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responsesTypes = responses.map { $0.type }
        
        for responseType in responsesTypes {
            let newCount: Int
            
            if let oldCount = frequencyOfAnswers[responseType] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }
            
            frequencyOfAnswers[responseType] = newCount
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted( by: { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultsDefinitionLabel.text = mostCommonAnswer.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
