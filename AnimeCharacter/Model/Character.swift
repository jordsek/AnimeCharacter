//
//  Character.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import Foundation
struct Character: Decodable,Identifiable,Hashable {
    
    let id: Int
    let name: String
    let localizedName: String
    let attackType: String
    let img: String
    let icon: String
  
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case attackType = "attack_type"
        case img, icon
        
        

    }
}

let characterList = Character(
    id: 1,
    name: "npc_dota_hero_antimage",
    localizedName: "Anti-Mage",
    attackType: "Melee",
    img: "/apps/dota2/images/dota_react/heroes/antimage.png?",
    icon: "/apps/dota2/images/dota_react/heroes/icons/antimage.png?"
)

    

