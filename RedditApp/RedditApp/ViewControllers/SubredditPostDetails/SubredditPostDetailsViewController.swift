//
//  SubredditPostDetailsViewController.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

class SubredditPostDetailsViewController: UIViewController {
    var viewModel: SubredditPostDetailsViewModel!

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!

    override func viewDidLoad() {
        title = viewModel.post.data.title
        customizeOverview()
    }

    private func customizeOverview() {
        let data = viewModel.post.data

        if let urlString = data.thumbnail, let url = URL(string: urlString) {
            Task {
                await postImageView.downloadImage(from: url)
            }
        } else {
            postImageView.image = .warning
            postImageView.contentMode = .scaleAspectFit
        }

        postTitleLabel.text = data.title.capitalized
        upvotesLabel.text = "\(data.ups) upvotes"
        commentsLabel.text = "\(data.num_comments) comments"
    }
}

extension SubredditPostDetailsViewController {
    static func create(post: PostData) -> SubredditPostDetailsViewController? {
        guard let viewController = UIStoryboard(name: SubredditPostDetailsViewController.classIdentifier, bundle: nil).instantiateInitialViewController() as? SubredditPostDetailsViewController else { return nil }

        viewController.viewModel = SubredditPostDetailsViewModel(post: post)

        return viewController
    }
}
