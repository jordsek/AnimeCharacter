//
//  ContentViewUITest.swift
//  AnimeCharacterUITests
//
//  Created by Jor . on 19/03/2023.
//

import XCTest

final class ContentViewUITest: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        
    }

    override func tearDownWithError() throws {
       app = nil
    }

    func testAppNotNil() throws {
        // UI tests must launch the application that they test.
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(app)

    }
    
    func testLabels(){
        XCTAssertTrue(app.staticTexts["Anti-Mage"].exists)
        XCTAssertTrue(app.staticTexts["Axe"].exists)
        
    }
    
    func testTitle(){
        let title = app.staticTexts["Click on a character"]
        XCTAssertTrue(title.exists)
    }

    
}
