//
//  final_project_shaliniTests.swift
//  final-project-shaliniTests
//
//  Created by Shalu Garikapaty on 2/20/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import XCTest

class final_project_shaliniTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleSucceeds() {
        let bleedingItem = SymptomView.init("bleed", 4)
            XCTAssertNotNil(bleedingItem)
            let ache = SymptomView.init("stomach ache", 5)
            XCTAssertNotNil(ache)
    }
    
    func testExampleFails() {
        let noSymptomMentioned = SymptomView.init("", 3)
        XCTAssertNil(noSymptomMentioned)
        let negativeRating = SymptomView.init("cramps", -2)
        XCTAssertNil(negativeRating)
        
    }
    
    func testAddSymptomsperMonth() {
        let bleedingItem = SymptomView.init("bleed", 4)!
        let ache = SymptomView.init("stomach ache", 5)
        let symptomsList = SymptomLogPerMonth.init()
        XCTAssertEqual(0, symptomsList.symptoms.count)
        symptomsList.addSymptom(symptom: bleedingItem)
        XCTAssertEqual(1, symptomsList.symptoms.count)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
