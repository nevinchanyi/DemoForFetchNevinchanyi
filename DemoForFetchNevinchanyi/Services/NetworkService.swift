//
//  NetworkService.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import Foundation

protocol NetworkServable {
    func request<T>(
        endpoint: EndpointInterface,
        timeoutInterval: Double) async throws -> T where T: Decodable
}

final class NetworkService: NetworkServable {
    
    @discardableResult
    func request<T>(
        endpoint: EndpointInterface,
        timeoutInterval: Double
    ) async throws -> T where T: Decodable {
        
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }
                      
            try await handleStatusCode(response.statusCode)
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                throw NetworkError.decoding(data: String(decoding: data, as: UTF8.self))
            }

        } catch {
            throw NetworkError.network(error: error)
        }
    }
    
    private func handleStatusCode(_ statusCode: Int) async throws {
        switch statusCode {
        case 200...299:
            return
        default:
            throw NetworkError.unexpectedStatusCode(code: statusCode)
        }
    }
}
