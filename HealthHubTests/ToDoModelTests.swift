//
//  ToDoModelTests.swift
//  HealthHubTests
//
//  Created by Batu Akdoğan on 20.11.2023.
//

import XCTest
@testable import HealthHub


final class ToDoModelTests: XCTestCase {

    
    let sampleToDoItem = ToDoItem(id: "1", title: "Sample Task", isCompleted: false, date: Date())

        func testToDoItemCreation() {
            XCTAssertEqual(sampleToDoItem.id, "1", "ID değeri beklenen değere eşit değil")
            XCTAssertEqual(sampleToDoItem.title, "Sample Task", "Başlık değeri beklenen değere eşit değil")
            XCTAssertFalse(sampleToDoItem.isCompleted, "Varsayılan olarak tamamlanmamış olmalı")
            XCTAssertNotNil(sampleToDoItem.date, "Tarih değeri nil olmamalı")
        }

        

}
