//
//  FakeCharacterRepository.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 23/03/2023.
//

import Foundation
@testable import AnimeCharacter

class FakeCharacterRepository: CharactersRepository{
    func getCharacters(url: URL) async throws -> [Character] {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else
            {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            let lists = try JSONDecoder().decode([Character].self, from: data)
            return lists
        } catch {
            print(error)
            throw NetworkError.dataNotFound
        }
    }
    
    
}
