//
//  BMIViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class BMIViewModel {
    var bmi: BMI?
    
    
    //bmi calculate actions
    func calculateBMI(height: Double, weight: Double) {
        let newBMI = BMI(height: height, weight: weight)
        bmi = newBMI
    }
    
    
}
