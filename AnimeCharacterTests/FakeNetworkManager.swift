//
//  FakeNetworkManager.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 19/03/2023.
//

import Foundation
@testable import AnimeCharacter

class FakeNetworkManager: Networkable{
    func getDataFromAPI(url: URL) async throws -> Data {
        do{
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: "CharacterSampleTestFile", withExtension: "json")else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            return data
        }catch let error{
            print(error.localizedDescription)
            throw NetworkError.dataNotFound
        }
        
        
    }
}
