//
//  PersonInfoTests.swift
//  HealthHubTests
//
//  Created by Batu Akdoğan on 20.11.2023.
//

import XCTest
@testable import HealthHub

final class PersonInfoTests: XCTestCase {

        let samplePersonInfo = PersonInfo(age: 25, gender: .male, weight: 70.0, height: 1.75, activityLevel: .lightlyActive)

        func testPersonInfoCreation() {
            XCTAssertEqual(samplePersonInfo.age, 25, "Yaş değeri beklenen değere eşit değil")
            XCTAssertEqual(samplePersonInfo.gender, .male, "Cinsiyet değeri beklenen değere eşit değil")
            XCTAssertEqual(samplePersonInfo.weight, 70.0, "Ağırlık değeri beklenen değere eşit değil")
            XCTAssertEqual(samplePersonInfo.height, 1.75, "Boy değeri beklenen değere eşit değil")
            XCTAssertEqual(samplePersonInfo.activityLevel, .lightlyActive, "Aktivite seviyesi beklenen değere eşit değil")
        }

}
