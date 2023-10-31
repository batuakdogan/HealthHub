//
//  CalorieCalculatorViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 31.10.2023.
//

import UIKit

class CalorieCalculatorViewController:
    UIViewController {
    
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var activityLevelSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    var viewModel: CalorieCalculatorViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CalorieCalculatorViewModel(personInfo: PersonInfo(age: 0, gender: .male, weight: 0.0, height: 0.0, activityLevel: .sedentary))

    }
    

    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let ageText = ageTextField.text, let weightText = weightTextField.text, let heightText = heightTextField.text else {
                    return
                }
        
        if let age = Int(ageText), let weight = Double(weightText), let height = Double(heightText) {
                    let gender: Gender = genderSegmentedControl.selectedSegmentIndex == 0 ? .male : .female
                    let activityLevel: ActivityLevel
                    
                    switch activityLevelSegmentedControl.selectedSegmentIndex {
                    case 0:
                        activityLevel = .sedentary
                    case 1:
                        activityLevel = .lightlyActive
                    case 2:
                        activityLevel = .moderatelyActive
                    case 3:
                        activityLevel = .veryActive
                    case 4:
                        activityLevel = .superActive
                    default:
                        activityLevel = .sedentary
                    }
                    
                    // reload viewmodel
                    viewModel?.personInfo = PersonInfo(age: age, gender: gender, weight: weight, height: height, activityLevel: activityLevel)
                    
                    // calculate
                    let dailyCalories = viewModel?.calculateDailyCalories() ?? 0.0
                    resultLabel.text = "Günlük Kalori İhtiyacınız: \(Int(dailyCalories)) kalori"
                }
    }
    
    
    

}
