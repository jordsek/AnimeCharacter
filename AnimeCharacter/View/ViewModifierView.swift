//
//  ViewModifierView.swift
//  AnimeCharacter
//
//  Created by Jor . on 21/03/2023.
//

import Foundation
import SwiftUI

struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.brown)
            .padding(.horizontal)
    }
}

struct LocalisedText: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.black)
            .padding(.vertical, 25)
    }
}
