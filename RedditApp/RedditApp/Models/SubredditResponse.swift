//
//  SubredditResponse.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

struct SubredditResponse: Codable {
    let kind: String
    let data: SubredditData
}

struct SubredditData: Codable {
    let children: [PostData]
}

struct PostData: Codable {
    let kind: String
    let data: ChildData
}

struct ChildData: Codable {
    let title: String
    let created: Int
    let num_comments: Int
    let ups: Int
    let thumbnail: String?
    let preview: PreviewImage?
    
    func postedAgo(setDate: Date = Date()) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(created))
        let now = setDate
        let difference = now.timeIntervalSince(date)
        let minutes = Int(difference / 60)
        let hours = Int(difference / 3600)
        let days = Int(difference / 86400)
        
        if minutes < 2 {
            return "Just now"
        } else if minutes < 15 {
            return "A few minutes ago"
        } else if minutes < 60 {
            let grammar = minutes == 1 ? "minute" : "minutes"
            return "\(minutes) \(grammar) ago"
        } else if hours < 24 {
            let grammar = hours == 1 ? "hour" : "hours"
            return "\(hours) \(grammar) ago"
        } else {
            let grammar = days == 1 ? "day" : "days"
            return "\(days) \(grammar) ago"
        }
    }
}

struct PreviewImageSource: Codable {
    let url: String
    let width: Int
    let height: Int
}

struct PreviewImage: Codable {
    let images: [PostImage]
}

struct PostImage: Codable {
    let source: PreviewImageSource
    let resolutions: [PreviewImageSource]
    let id: String
}

struct Preview: Codable {
    let images: [PreviewImage]
    let enabled: Bool
}
