//
//  BMIModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import Foundation

struct BMI {
    var height: Double
    var weight: Double
    var index: Double {
        return weight / (height * height)
    }
}
