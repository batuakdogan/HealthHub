//
//  BMIViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import UIKit
import Firebase
import FirebaseFirestore





class BMIViewController: UIViewController {
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    
    @IBOutlet weak var weightTexxtfield: UITextField!
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    var bmiSaveViewModel = BMISaveViewModel()


    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    var viewModel = BMIViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(false, animated: false)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        
    }
    
    
    @IBAction func accountButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toAccountSegue", sender: nil)
    }
    
    
    
    
    
    @IBAction func savedBMIButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toBMI", sender: nil)
    }
    
        
    
    
    
    @IBAction func saveButton(_ sender: Any) {
    
        
        
        if let text = resultLabel.text{
                    bmiSaveViewModel.saveBMIValue(text) { error in
                        if let error = error {
                            print("Hata: \(error.localizedDescription)")
                        } else {
                            print("BMI değeri başarıyla kaydedildi.")
                        }
                    }
                } else {
                    print("Geçersiz bir BMI değeri.")
                }
        
      
        
    }

    
    @objc func calculateButtonTapped() {
        if let height = Double(heightTextField.text ?? ""), let weight = Double(weightTexxtfield.text ?? "") {
            viewModel.calculateBMI(height: height, weight: weight)
            
            
            
            if let bmi = viewModel.bmi {
                resultLabel.text = "BMI:\(String(format: "%.2f", bmi.index))" // for double number
            }
        } else {
            resultLabel.text = "Geçersiz giriş!"
        }
        
        
                }
    

            }
        
   


