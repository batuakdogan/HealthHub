//
//  BMIViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import Foundation

class BMIViewModel {
    var bmi: BMI?
    
    func calculateBMI(height: Double, weight: Double) {
        let newBMI = BMI(height: height, weight: weight)
        bmi = newBMI
    }
}
