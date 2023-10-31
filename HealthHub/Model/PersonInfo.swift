//
//  PersonInfo.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 31.10.2023.
//

import Foundation
struct PersonInfo {
    var age: Int
    var gender: Gender
    var weight: Double
    var height: Double
    var activityLevel: ActivityLevel
}

enum Gender {
    case male
    case female
}

enum ActivityLevel {
    case sedentary
    case lightlyActive
    case moderatelyActive
    case veryActive
    case superActive
}

