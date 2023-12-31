//
//  ViewController.swift
//  Project02
//
//  Created by Michel Jaejin Kim on 11/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) score: \(score)"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var title: String
        var actionTitle: String
        var message: String
        
        questionNumber += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        if questionNumber == 10 {
            message = "Final score: \(score)"
            actionTitle = "Restart"
            questionNumber = 0
            score = 0
        } else {
            message = """
            Question number: \(questionNumber)\n
            Wrong! That's flag of \(countries[sender.tag].uppercased())
            """
            actionTitle = "Continue"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)

        
        ac.addAction(UIAlertAction(title: actionTitle, style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
}

