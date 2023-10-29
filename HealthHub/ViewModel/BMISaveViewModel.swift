//
//  BMISaveViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 29.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class BMISaveViewModel {
    private let firebaseManager = FirebaseManager()
    
    func saveBMIValue(_ value: String, completion: @escaping (Error?) -> Void) {
        let currentDate = Date()
        let bmiData = BMISaveModel(bmiValue: value, date: currentDate)
        
        firebaseManager.saveBMIData(bmiData, completion: completion)
    }
    func loadBMIValues(completion: @escaping ([BMISaveModel]?, Error?) -> Void) {
        firebaseManager.loadBMIData { (bmiDataArray, error) in
                completion(bmiDataArray, error)
            }
        }
}
