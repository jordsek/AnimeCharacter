//
//  Fetchable.swift
//  AnimeCharacter
//
//  Created by Jor . on 23/03/2023.
//

import Foundation

protocol Fetchable {
    func getDataFromAPI(url: URL) async throws -> Data
}
