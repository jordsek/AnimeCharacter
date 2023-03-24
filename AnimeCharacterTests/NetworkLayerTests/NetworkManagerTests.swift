//
//  NetworkManagerTests.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 23/03/2023.
//

import XCTest
@testable import AnimeCharacter
final class NetworkManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /*
     When api is successfull
     get function will return expected data, reading data from locally saved json
     */
    func test_get_Character_list_when_api_is_success() async{
        //reading locl Json file Data
        let bundle = Bundle(for: NetworkManagerTests.self)
        guard let path = bundle.url(forResource: "CharacterSampleTestFile", withExtension: "json")
            else{ return }
        let data = try? Data(contentsOf: path)
        NetworkingMock.data = data
        
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string: "http://www.test.com")!
        let actualData = try! await networkManager.getDataFromAPI(url: url)
        XCTAssertEqual(actualData, data)
    }
    
    /*
     when api is successfull but json parsin fails
     Fetch function will return jsonParsingFailed exception
     */
    
    func test_get_Employee_list_failes() async{
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string: "http://www.test.com")!
        
        do {
            let _ = try await networkManager.getDataFromAPI(url: url)
        }catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFound)
        }
    }



    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
