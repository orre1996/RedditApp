//
//  SubredditListViewModel.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

enum SubredditListCellType {
    case error
    case post(PostData)
}

@MainActor
final class SubredditListViewModel {
    private let subredditRepository: SubredditRepositoryProtocol
    
    private(set) var rows = [SubredditListCellType]()
    private(set) var selectedSubreddit = Subreddit.swiftui

    init(subredditRepository: SubredditRepositoryProtocol = SubredditRepository.shared) {
        self.subredditRepository = subredditRepository
    }

    func getSubreddit(_ subreddit: Subreddit) async {
        selectedSubreddit = subreddit

        switch await subredditRepository.getSubreddit(selectedSubreddit) {
            case .success(let response):
                self.rows = response.data.children.sorted(by: { $0.data.created > $1.data.created }).map({ .post($0)})

            case .failure(_):
                self.rows = [.error]
        }
    }
}
