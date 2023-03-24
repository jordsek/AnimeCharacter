//
//  CharacterRepositoryImplementation.swift
//  AnimeCharacter
//
//  Created by Jor . on 21/03/2023.
//

import Foundation

final class CharacterRepositoryImplementation: CharactersRepository {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getCharacters(url: URL) async throws -> [Character] {
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode([Character].self, from: data)
            return result
        }catch {
            throw error
        }
    }
    
    
}
