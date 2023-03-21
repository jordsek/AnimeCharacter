//
//  CharactersRepository.swift
//  AnimeCharacter
//
//  Created by Jor . on 21/03/2023.
//

import Foundation
protocol CharactersRepository {
    func getCharacters(url: URL) async throws -> [Character]
}

