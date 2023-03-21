//
//  CharacterDetailView.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    var name = "Name:"
    var attackName = "Attack name:"
    var attackType = "Attack type:"
    var body: some View {
        NavigationStack {
            VStack{
              
                URLImage(url: URL(string: "\(APIEndPoint1.baseUrl)\(character.img)"))

                    VStack{
                        Text("\(name) \(character.localizedName)")
                        Text("\(attackName) \(character.name)")
                        Text("\(attackType) \(character.attackType)")
                    }
                    .modifier(Title())
            }
            .navigationTitle("\(character.localizedName) Details")
        }
    }
}



struct CharacterDetailView_Previews: PreviewProvider {
    var character: Character
    static var previews: some View {
        CharacterDetailView(character: Character(id: 0, name: "", localizedName: "", attackType: "", img: "", icon: ""))
    }
}


