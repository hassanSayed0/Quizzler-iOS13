//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updataUI()
    }
    
    @IBAction func answerQuestionPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer (sender.currentTitle!){
            sender.backgroundColor = .green
        }else{
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        updataUI()
    }
    
    
    func updataUI(){
        progressBar.progress=quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1.setTitle(quizBrain.getAnswerText()[0], for: .normal)
        choice2.setTitle(quizBrain.getAnswerText()[1], for: .normal)
        choice3.setTitle(quizBrain.getAnswerText()[2], for: .normal)

        DispatchQueue.main.asyncAfter(deadline: .now()+0.4){
            self.choice3.backgroundColor = .clear
            self.choice2.backgroundColor = .clear
            self.choice1.backgroundColor = .clear
        }
    }
}

