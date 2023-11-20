//
//  BMITests.swift
//  HealthHubTests
//
//  Created by Batu Akdoğan on 20.11.2023.
//

import XCTest
@testable import HealthHub


final class BMITests: XCTestCase {

        let sampleBMI1 = BMI(height: 1.75, weight: 68.0)
        let sampleBMI2 = BMI(height: 1.60, weight: 55.0)
        let sampleBMI3 = BMI(height: 1.80, weight: 90.0)

        func testBMIIndexCalculation() {
            XCTAssertEqual(sampleBMI1.index, 22.20408163265306, accuracy: 0.001, "BMI hesaplama hatası")
            XCTAssertEqual(sampleBMI2.index, 21.484374999999996, accuracy: 0.001, "BMI hesaplama hatası")
            XCTAssertEqual(sampleBMI3.index, 27.777777777777775, accuracy: 0.001, "BMI hesaplama hatası")
        }

        func testNegativeHeight() {
            let negativeHeightBMI = BMI(height: -1.70, weight: 60.0)
            XCTAssertLessThan(negativeHeightBMI.index, 0, "Negatif boy değeri bekleniyor")
        }

        func testZeroWeight() {
            let zeroWeightBMI = BMI(height: 1.65, weight: 0.0)
            XCTAssertEqual(zeroWeightBMI.index, 0, "Sıfır ağırlık için BMI değeri 0 olmalıdır")
        }
    

}
