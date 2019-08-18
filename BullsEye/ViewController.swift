//
//  ViewController.swift
//  BullsEye
//
//  Created by gamma on 18/8/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let message = "The value of roundedValue is now: \(currentValue)" +
        "\nThe target value is now: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
        currentValue = 50
        slider.value = Float(currentValue)
    }

}

