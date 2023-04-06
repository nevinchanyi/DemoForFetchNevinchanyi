//
//  NetworkService+Image.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import UIKit


extension NetworkService {
    
    @discardableResult
    func getImage(with url: URL?) async throws -> UIImage? {
        guard let url else { return nil }
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            return image
        } else {
            return try await downloadImage(with: url)
        }
    }
    
    @discardableResult
    private func downloadImage(with url: URL) async throws -> UIImage? {
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await urlSession.data(for: urlRequest)
            
            let image = UIImage(data: data)
            
            if let image = image {
                cache.setObject(image, forKey: url.absoluteString as NSString)
            }
            return image
        } catch {
            throw NetworkError.cantDownloadImage(error: error)
        }
    }
}
