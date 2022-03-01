//
//  ViewController.swift
//  finalGradeCalculator
//
//  Created by isa fontana on 3/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentGradeTextField: UITextField!
    
    @IBOutlet weak var desiredGradeTextField: UITextField!
    
    @IBOutlet weak var examPercentWorthTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    

    @IBAction func calculateButton(_ sender: UIButton) {
        
        let currentGradeString = currentGradeTextField.text ?? ""
        let desiredGradeString = desiredGradeTextField.text ?? ""
        let examPercentWorthString = examPercentWorthTextField.text ?? ""
        
        var input1 = Double(currentGradeString) ?? 0
        var input2 = Double(desiredGradeString) ?? 0
        var input3 = Double(examPercentWorthString) ?? 0
        
        var calculate = ((input2) - ((1 - (input3/100))*input1))/input3
        
        var resultPercent = 100*calculate
      
        
        answerLabel.text = calculate as? String
        answerLabel.text = "You need a \(resultPercent)% on the exam"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        answerLabel.text = "Answer"
    }


}

