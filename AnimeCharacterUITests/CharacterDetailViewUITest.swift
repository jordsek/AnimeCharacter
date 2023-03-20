//
//  CharacterDetailViewUITest.swift
//  AnimeCharacterUITests
//
//  Created by Jor . on 19/03/2023.
//

import XCTest

final class CharacterDetailViewUITest: XCTestCase {

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

    func testFlowCreation(){
        
        let app = XCUIApplication()
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
      
        let attackNameNpcDotaHeroAntimageStaticText = app.staticTexts["Attack name: npc_dota_hero_antimage"]
       
        app.staticTexts["Attack type: Melee"].tap()
        
        
        element.tap()
                
    }

}
