//
//  Character.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import Foundation
struct Character: Codable,Identifiable,Hashable {
    
    let id: Int
    let name: String
    let localizedName: String
    let attackType: String
    let img: String
    let icon: String
    let attackRange: Int
    let attackRate: Double
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case attackType = "attack_type"
        case img, icon
        case attackRange = "attack_range"
        case attackRate = "attack_rate"
        

    }
}


    
