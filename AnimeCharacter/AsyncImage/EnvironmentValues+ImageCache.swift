//
//  EnvironmentValues+ImageCache.swift
//  AnimeCharacter
//
//  Created by Jor . on 19/03/2023.
//

import Foundation

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
