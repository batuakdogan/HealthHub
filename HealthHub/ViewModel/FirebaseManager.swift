//
//  FirebaseManager.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 29.10.2023.
//

import Foundation
import Firebase
class FirebaseManager {
    private let db = Firestore.firestore()
    
    func saveBMIData(_ data: BMISaveModel, completion: @escaping (Error?) -> Void) {
        db.collection("bmiHistory").addDocument(data: [
            "bmiValue": data.bmiValue,
            "date": data.date
        ]) { error in
            completion(error)
        }
    }
    func loadBMIData(completion: @escaping ([BMISaveModel]?, Error?) -> Void) {
            db.collection("bmiHistory").getDocuments { (querySnapshot, error) in
                if let error = error {
                    completion(nil, error)
                } else {
                    var bmiDataArray: [BMISaveModel] = []

                    for document in querySnapshot!.documents {
                        if let bmiValue = document.data()["bmiValue"] as? String,
                           let dateTimestamp = document.data()["date"] as? Timestamp {
                            let date = dateTimestamp.dateValue()
                            let bmiData = BMISaveModel(bmiValue: bmiValue, date: date)
                            bmiDataArray.append(bmiData)
                        }
                    }
                    completion(bmiDataArray, nil)
                }
            }
        }

}
