//
//  AnimeCharacterViewModel.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import Foundation
@MainActor
final class AnimeCharacterViewModel: ObservableObject{
    @Published var characterArray: [Character] = []
    @Published var customError: NetworkError?
    let networkManager : Networkable
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func getCharacterList(urlString: String) async {
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode([Character].self, from: data)
            DispatchQueue.main.async { [self] in
                self.characterArray = result.self
                //print(characterArray)
            }
            
        }catch let someError {
            print(someError.localizedDescription)
            if someError as! NetworkError == NetworkError.parsingError{
                customError = NetworkError.parsingError
            }else{
                customError = NetworkError.dataNotFound
            }
            
        }
    }
    
}
