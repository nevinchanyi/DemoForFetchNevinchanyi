//
//  UIImage+Extenstion.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import UIKit

extension UIImage {
    
//    convenience init?(url: URL?) {
//        self.init()
//        guard let url else { return nil }
//        Task { @MainActor in
//            let networkService = NetworkService()
//            return try? await networkService.getImage(with: url)
//        }
//    }
    
//    func downloadImage(url: URL?) -> UIImage? {
//        guard let url else { return nil }
//        let networkService = NetworkService()
//
//        Task { @MainActor in
//            let networkService = NetworkService()
//            return try? await networkService.getImage(with: url)
//        }
//    }
}


extension UIImageView {
    
    func downloadImage(url: URL?) {
        guard let url else { return }
        let networkService = NetworkService()
        Task {
            let uiImage = try? await networkService.getImage(with: url)
            await MainActor.run {
                self.image = uiImage
            }
        }
    }
}
