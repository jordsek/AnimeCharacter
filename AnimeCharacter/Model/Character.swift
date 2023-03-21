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


    
