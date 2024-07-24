//
//  SubredditRepository.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

protocol SubredditRepositoryProtocol {
    func getSubreddit(_ subreddit: Subreddit) async -> Result<SubredditResponse, NetworkError>
}

final class SubredditRepository: SubredditRepositoryProtocol {
    static let shared = SubredditRepository()

    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }

    func getSubreddit(_ subreddit: Subreddit) async -> Result<SubredditResponse, NetworkError> {
        return await networkManager.get(endpoint: .subreddit(subreddit))
    }
}
