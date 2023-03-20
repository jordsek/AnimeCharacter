//
//  ImageLoader.swift
//  AnimeCharacter
//
//  Created by Jor . on 19/03/2023.
//

import Foundation

import UIKit

enum NetWorkError: Error{
    case badRequest
    case unsupportedImage
    case badUrl
}

@MainActor
class ImageLoader: ObservableObject{
    
    @Published var uiImage: UIImage?
    private static let cache = NSCache<NSString, UIImage>()
    
    func fetchImage(_ url: URL?) async throws {
        
        guard let url = url else{
            throw NetWorkError.badUrl
        }
        
        let request = URLRequest(url: url)
        
        //check in cache
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString){
            uiImage = cachedImage
        }else {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetWorkError.badRequest
            }
            
            guard let image = UIImage(data: data) else {
                throw NetWorkError.unsupportedImage
            }
            
            //store in cache
            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            uiImage = image
        }
        
        
    }
    
}
