//
//  NetworkingMock.swift
//  AnimeCharacterTests
//
//  Created by Jor . on 23/03/2023.
//

import Foundation
@testable import AnimeCharacter

class NetworkingMock: Networking {
    static var data: Data?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
    
    
}
