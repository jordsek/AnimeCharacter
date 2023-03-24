//
//  ContentView.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: CharacterViewModel
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.characterArray){ character in
                    NavigationLink{
                       CharacterDetailView(character: character)
                    }label: {
                       URLImage(url: URL(string: "\(APIEndPoint1.baseUrl)\(character.icon)"))
                        
                        Spacer()
                        Text(character.localizedName)
                            .modifier(LocalisedText())
                       }
                   }
                
                }.task {
                        await viewModel.getCharacterList(urlString: APIEndPoint.UsersListAPIEndPoint)
                }
                .navigationTitle("Click on a character")
            }
            .padding()
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CharacterViewModel(repository: CharacterRepositoryImplementation(networkManager: NetworkManager())))
    }
}
