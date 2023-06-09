//
//  CharactersRepositoryTests.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 23/03/2023.
//

import XCTest
@testable import AnimeCharacter

final class CharactersRepositoryTests: XCTestCase {

    var fakeNetworkManager: FakeNetworkManager!
    var characterRepositoryImplementation: CharacterRepositoryImplementation!
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        characterRepositoryImplementation = CharacterRepositoryImplementation(networkManager: fakeNetworkManager)
    }

    override func tearDownWithError() throws {
        characterRepositoryImplementation = nil
    }

    //when passes character array will return with some data
    func test_when_get_Character_Array_susccess() async{
        
            let arr = try! await characterRepositoryImplementation.getCharacters(url: URL(string: "CharacterSampleTestFile")!)
            XCTAssertNotNil(arr)
            XCTAssertEqual(arr.count, 124)
            XCTAssertEqual(arr.first?.localizedName, "Anti-Mage")
    }
    
    func test_when_get_character_list_fails() async throws{
        let list = try? await characterRepositoryImplementation.getCharacters(url: URL(string: "CharacterSampleNodata")!)
        XCTAssertNil(list)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
