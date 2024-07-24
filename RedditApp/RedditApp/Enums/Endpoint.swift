//
//  Endpoint.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

enum Endpoint {
    case subreddit(Subreddit)

    private var baseUrl: String {
        let environment: Environment = SettingsManager.shared.get(key: EnvironmentSettingKey.environment) ?? .production

        switch environment {
            case .production:
                return "https://www.reddit.com"
        }
    }

    var path: String {
        switch self {
            case .subreddit(let subreddit):
                return "\(baseUrl)/r/\(subreddit.rawValue)/hot.json"
        }
    }
}
