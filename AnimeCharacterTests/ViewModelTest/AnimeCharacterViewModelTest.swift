//
//  AnimeCharacterViewModelTest.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 19/03/2023.
//

import XCTest
@testable import AnimeCharacter
@MainActor
final class AnimeCharacterViewModelTest: XCTestCase {
      
    
    override func setUpWithError() throws {
       
    }
    
    override func tearDownWithError() throws {
        
    }
    
    //When url is correct, you should have some data in CharacterArray
    func testGetCharacterList_When_data_isCorrect() async{
        let fakeCharacterRepository = FakeCharacterRepository()
        let characterViewModel =  CharacterViewModel(repository: fakeCharacterRepository)
        
        
        await characterViewModel.getCharacterList(urlString: "CharacterSampleTestFile")
        let characterList =   characterViewModel.characterArray
        XCTAssertNotNil(characterList)
        XCTAssertEqual("Anti-Mage", characterList.first?.localizedName)
        XCTAssertEqual("Melee", characterList.first?.attackType)
        XCTAssertEqual("npc_dota_hero_antimage", characterList.first?.name)
        XCTAssertEqual(characterList.count, 124)
        
        let  localError =  characterViewModel.customError
        XCTAssertNil(localError)
    }
    
    //when url is incorrect, it will return immediately, no data in characterArray
    func test_getCharacterList_When_Url_isNotGiven() async {
        let fakeCharacterRepository = FakeCharacterRepository()
        let characterViewModel =  CharacterViewModel(repository: fakeCharacterRepository)

        await characterViewModel.getCharacterList(urlString: "")
        let characterList =  characterViewModel.characterArray
        XCTAssertEqual(characterList.count, 0)

        let localError =  characterViewModel.customError
        XCTAssertEqual(localError, .invalidURL)

        XCTAssertNotNil(localError)
    }


    func testGetCharacterList_when_APIFails() async{
        let fakeCharacterRepository = FakeCharacterRepository()
        let characterViewModel =  CharacterViewModel(repository: fakeCharacterRepository)

        XCTAssertNotNil(characterViewModel)

        await characterViewModel.getCharacterList(urlString: "CharacterSampleNodata")

        let characterList =  characterViewModel.characterArray
        XCTAssertEqual(characterList.count, 0)

        let localError = characterViewModel.customError
        XCTAssertNotNil(localError)

        XCTAssertEqual(localError, NetworkError.dataNotFound)
    }

    func testGetEmployeeList_When_URL_is_Incorrect() async{
        let fakeCharacterRepository = FakeCharacterRepository()
        let characterViewModel =  CharacterViewModel(repository: fakeCharacterRepository)

        XCTAssertNotNil(characterViewModel)

        await characterViewModel.getCharacterList(urlString: "CharacterSampleTestFileWrongURL")

        let characterList =  characterViewModel.characterArray
        XCTAssertEqual(characterList.count, 0)

        let localError =  characterViewModel.customError
        XCTAssertNotNil(localError)

        XCTAssertEqual(localError, NetworkError.dataNotFound)
    }
    
}
