//
//  CharacterDetailView.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    var baseURL = "https://api.opendota.com"
    var body: some View {
        NavigationStack {
            VStack{
              
                URLImage(url: URL(string: "\(baseURL)\(character.img)"))
    //            AsyncImage(url: URL(string: "\(baseURL)\(character.img)")){ image in
    //                              image.resizable()
    //                                  .aspectRatio(contentMode: .fit)
    //                                  .border(.indigo)
    //                          }placeholder: {
    //                              ProgressView()
    //                          }
                
                    
                    VStack{
                        Text("Name: \(character.localizedName)")
                        Text("Attack name: \(character.name)")
                        Text("Attack type: \(character.attackType)")
                    }
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.brown)
                    .padding(.horizontal)

                
                
            }
            .navigationTitle("\(character.localizedName) Details")
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    var character: Character
    static var previews: some View {
        CharacterDetailView(character: Character(id: 0, name: "", localizedName: "", attackType: "", img: "", icon: "", attackRange: 0, attackRate: 0.0))
    }
}
