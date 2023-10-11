//
//  BMIViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import UIKit

class BMIViewController: UIViewController {
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    
    @IBOutlet weak var weightTexxtfield: UITextField!
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    var viewModel = BMIViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)

        
    }
    

    
    @objc func calculateButtonTapped() {
            if let height = Double(heightTextField.text ?? ""), let weight = Double(weightTexxtfield.text ?? "") {
                viewModel.calculateBMI(height: height, weight: weight)
                
                
                
                if let bmi = viewModel.bmi {
                    resultLabel.text = "BMI: \(String(format: "%.2f", bmi.index))"
                }
            } else {
                resultLabel.text = "Geçersiz giriş!"
            }
        }
    }
   


