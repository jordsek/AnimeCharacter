//
//  AnimeCharacterViewModelTest.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 19/03/2023.
//

import XCTest
@testable import AnimeCharacter

final class AnimeCharacterViewModelTest: XCTestCase {

    var animeCharacterViewModel: AnimeCharacterViewModel!
    
    @MainActor override func setUpWithError() throws {
        let fakeNetWorkManager = FakeNetworkManager()
        animeCharacterViewModel = AnimeCharacterViewModel(networkManager: fakeNetWorkManager)
    }

    override func tearDownWithError() throws {
        animeCharacterViewModel = nil
    }

    @MainActor func testGetCharacterList_When_data_isCorrect() async{
        XCTAssertNotNil(animeCharacterViewModel)
        
        let expectation = XCTestExpectation(description: "Fetching Character list")
        await animeCharacterViewModel.getCharacterList(urlString: "CharacterSampleTestFile")
        Task{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                XCTAssertEqual(self.animeCharacterViewModel.characterArray.count, 20)
                let character = self.animeCharacterViewModel.characterArray.first
                XCTAssertEqual("Anti-Mage", character?.localizedName)
                XCTAssertEqual("Melee", character?.attackType)
                XCTAssertEqual("npc_dota_hero_antimage", character?.name)
                
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10)

        }
    }
    
    @MainActor func testGetCharacterList_When_URL_isWrong() async{
        XCTAssertNotNil(animeCharacterViewModel)
        let expectation = XCTestExpectation(description: "I shouldn't get data")
        await animeCharacterViewModel.getCharacterList(urlString: "CharacterSampleTestFile123")

        let duration = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + duration){
            XCTAssertEqual(self.animeCharacterViewModel?.characterArray.count, 0)
            XCTAssertNotNil(self.animeCharacterViewModel?.customError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)

    }
    
    
    @MainActor func testGetCharacterList_When_URL_isCorrectButAPIFails() async{
        await animeCharacterViewModel.getCharacterList(urlString: "CharacterSampleNodata")
        animeCharacterViewModel.customError = .dataNotFound
        let expectation = XCTestExpectation(description: "API should fail to give data")
        XCTAssertNotNil(self.animeCharacterViewModel.customError)
        XCTAssertEqual(self.animeCharacterViewModel.customError,.dataNotFound)
        expectation.fulfill()


    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
