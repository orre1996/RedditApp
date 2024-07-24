//
//  NetworkManager.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

protocol NetworkManagerProtocol {
    func get<T: Codable>(endpoint: Endpoint) async -> Result<T, NetworkError>
}

class NetworkManager: NetworkManagerProtocol {
    private let decoder = JSONDecoder()

    func get<T: Codable>(endpoint: Endpoint) async -> Result<T, NetworkError> {
        guard let url = URL(string: endpoint.path) else { return .failure(.invalidUrl) }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return .failure(.invalidStatusCode) }

            return .success(try decoder.decode(T.self, from: data))
        } catch {
            return .failure(.invalidResponse)
        }
    }
}
