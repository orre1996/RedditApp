//
//  RedditCategory.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

enum Subreddit: String {
    case aww = "Aww"
    case iosprogramming = "iOSProgramming"
    case swiftui = "SwiftUI"
    case swift = "Swift"
    case shouldFail = "shouldFail"
    
    static var randomSubreddit: Subreddit {
        let array: [Subreddit] = [.aww, .iosprogramming, .swiftui, .swift, .shouldFail]
        return array.randomElement() ?? .aww
    }
}
