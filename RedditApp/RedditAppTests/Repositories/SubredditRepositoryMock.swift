//
//  SubredditRepositoryMock.swift
//  RedditAppTests
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation
@testable import RedditApp

class SubredditRepositoryMock: SubredditRepositoryProtocol {
    var result: Result<RedditApp.SubredditResponse, RedditApp.NetworkError>!
    
    init(result: Result<RedditApp.SubredditResponse, RedditApp.NetworkError>!) {
        self.result = result
    }
    
    func getSubreddit(_ subreddit: Subreddit) async -> Result<SubredditResponse, NetworkError> {
        return result
    }
}
