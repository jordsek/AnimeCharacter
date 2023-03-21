//
//  CharacterViewModel.swift
//  AnimeCharacter
//
//  Created by Jor . on 21/03/2023.
//

import Foundation
class CharacterViewModel: ObservableObject{
    
    @Published var characterArray: [Character] = []
    @Published var customError: NetworkError?
    
    let repository: CharactersRepository
    init(repository: CharactersRepository){
        self.repository = repository
    }
    
    func getCharacterList(urlString: String) async{
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let result = try await repository.getCharacters(url: url)
            DispatchQueue.main.async { [self] in
                self.characterArray = result
                //print(characterArray)
            }
            
        }catch let someError {
            print(someError.localizedDescription)
            if someError as? NetworkError == .dataNotFound{
                self.customError = NetworkError.dataNotFound
            }else{
                self.customError = NetworkError.parsingError
            }
        }
        
    }
    
}
