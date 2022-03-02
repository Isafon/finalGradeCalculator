//
//  ViewController.swift
//  finalGradeCalculator
//
//  Created by isa fontana on 3/1/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    

//Segmented Controller
    @IBOutlet weak var segmentedControllerGrades: UISegmentedControl!
    
    
    
//View Picker
    @IBOutlet weak var viewPickerGrades: UIPickerView!
    
    var grades = ["A", "B", "C", "D"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        grades[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        view.endEditing(true)
        
        switch row {
            
        case 0:
            examPercentWorthTextField.text = "95"
        case 1:
            examPercentWorthTextField.text = "85"
        case 2:
            examPercentWorthTextField.text = "75"
        case 3:
            examPercentWorthTextField.text = "65"
        
        default: break
        }
    }

    
//EVERYTHING
    @IBOutlet weak var currentGradeTextField: UITextField!
    
    @IBOutlet weak var desiredGradeTextField: UITextField!
    
    @IBOutlet weak var examPercentWorthTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!

    @IBOutlet weak var helpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewPickerGrades.dataSource = self
        viewPickerGrades.delegate = self
        
        answerLabel.text = "Answer"
    }
    
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
        
        if (resultPercent < 100) {
            helpLabel.text = "Keep up the good work"
        
        } else {
            helpLabel.text = "You should ask your teacher for help."
        }
        
        
    }
    
    @IBAction func segmentIndexChanges(_ sender: UISegmentedControl) {
        
        switch  segmentedControllerGrades.selectedSegmentIndex
        {
        case 0:
            examPercentWorthTextField.text = "95"
        case 1:
            examPercentWorthTextField.text = "85"
        case 2:
            examPercentWorthTextField.text = "75"
        case 3:
            examPercentWorthTextField.text = "65"
            
        default: break
            
        }

    }
    
    
    
}
