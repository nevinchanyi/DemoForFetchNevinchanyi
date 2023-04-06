//
//  NetworkError.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case network(error: Error)
    case unexpectedStatusCode(code: Int)
    case noResponse
    case decoding(data: String)
    case cantDownloadImage(error: Error)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invelid url.", comment: "")
        case .network(let error):
            return NSLocalizedString("Network error.\n\(error.localizedDescription)", comment: "")
        case .unexpectedStatusCode(let code):
            return NSLocalizedString("Unexpected status code - \(code)", comment: "")
        case .noResponse:
            return NSLocalizedString("No response.", comment: "")
        case .decoding:
            return NSLocalizedString("Decoding error.", comment: "")
        case .cantDownloadImage:
            return NSLocalizedString("Can't download image.", comment: "")
        }
    }
}
