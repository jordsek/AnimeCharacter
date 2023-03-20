//
//  NetworkManager.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import Foundation
protocol Networkable{
    func getDataFromAPI(url: URL) async throws -> Data
}

final class NetworkManager: Networkable{
    func getDataFromAPI(url: URL) async throws -> Data {
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        }catch let error{
            print(error.localizedDescription)
            throw NetworkError.dataNotFound
        }
    }
}
