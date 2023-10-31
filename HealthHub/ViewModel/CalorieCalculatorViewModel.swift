//
//  CalorieCalculatorViewModel.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 31.10.2023.
//

import Foundation

class CalorieCalculatorViewModel {
    var personInfo: PersonInfo
    
    init(personInfo: PersonInfo) {
        self.personInfo = personInfo
    }
    
    func calculateDailyCalories() -> Double {
        var bmr: Double
        var dailyCalories: Double
        

        switch personInfo.gender {
        case .male:
            bmr = 88.362 + (13.397 * personInfo.weight) + (4.799 * personInfo.height) - (5.677 * Double(personInfo.age))
        case .female:
            bmr = 447.593 + (9.247 * personInfo.weight) + (3.098 * personInfo.height) - (4.330 * Double(personInfo.age))
        }
        
        switch personInfo.activityLevel {
        case .sedentary:
            dailyCalories = bmr * 1.2
        case .lightlyActive:
            dailyCalories = bmr * 1.375
        case .moderatelyActive:
            dailyCalories = bmr * 1.55
        case .veryActive:
            dailyCalories = bmr * 1.725
        case .superActive:
            dailyCalories = bmr * 1.9
        }
        
        return dailyCalories
    }
}

