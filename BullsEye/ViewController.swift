//
//  ViewController.swift
//  BullsEye
//
//  Created by gamma on 18/8/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close!"
        }
        
        score += points
        
        let message = "You scored \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        round += 1
        roundLabel.text = String(round)
        
        scoreLabel.text = String(score)
        
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
        
        currentValue = 50
        scoreLabel.text = String(score)
        slider.value = Float(currentValue)
    }
    
    @IBAction func resetGame() {
        round = 0
        score = 0
        startNewRound()
    }

}

