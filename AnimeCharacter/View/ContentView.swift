//
//  ContentView.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AnimeCharacterViewModel(networkManager: NetworkManager())
    var baseURL = "https://api.opendota.com"
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.characterArray){ character in
                    NavigationLink{
                       CharacterDetailView(character: character)
                    }label: {
                        HStack {
                            
                            URLImage(url: URL(string: "\(baseURL)\(character.icon)"))
                            }
                       
                            Spacer()

                            VStack {
                                Text(character.localizedName)
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                            }
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
        ContentView()
    }
}
