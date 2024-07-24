//
//  SubredditListTableViewCell.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

class SubredditListTableViewCell: UITableViewCell {
    @IBOutlet weak var postThumbnailImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postedAgoLabel: UILabel!

    private var post: PostData?
    private var task: Task<(), Never>?

    override func awakeFromNib() {
        backgroundColor = .clear
        selectionStyle = .none

        resetCell()
        customizeLabelFonts()
    }

    override func prepareForReuse() {
        resetCell()
    }
    
    func setup(post: PostData) {
        self.post = post

        postTitleLabel.text = post.data.title.capitalized
        postedAgoLabel.text = "Posted \(post.data.postedAgo())"

        downloadImage()
    }

    private func downloadImage() {
        guard let urlString = post?.data.thumbnail, let url = URL(string: urlString) else {
            postThumbnailImageView.image = .warning
            postThumbnailImageView.backgroundColor = .clear
            postThumbnailImageView.contentMode = .scaleAspectFit
            return
        }

        task = Task {
            await postThumbnailImageView.downloadImage(from: url)
        }
    }

    private func resetCell() {
        postTitleLabel.text = ""
        postedAgoLabel.text = ""
        postThumbnailImageView.image = nil
        task?.cancel()
    }
    
    private func customizeLabelFonts() {
        postTitleLabel.makeFontScalable(font: UIFont.systemFont(ofSize: 16, weight: .bold))
        postedAgoLabel.makeFontScalable(font: UIFont.systemFont(ofSize: 14, weight: .regular))
    }
}
