//
//  AnimeCharacterApp.swift
//  AnimeCharacter
//
//  Created by Jor . on 18/03/2023.
//

import SwiftUI

@main
struct AnimeCharacterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CharacterViewModel(repository: CharacterRepositoryImplementation(networkManager: NetworkManager())))
        }
    }
}
