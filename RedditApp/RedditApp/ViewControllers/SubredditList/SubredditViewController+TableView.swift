//
//  SubredditViewController+TableView.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

extension SubredditListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = viewModel.rows[indexPath.row]

        if let cell = ErrorTableViewCell.dequeue(for: indexPath, in: tableView), case .error = rowType {
            cell.setup(message: "Couldn't download data for r/\(viewModel.selectedSubreddit.rawValue). Please try again later")
            return cell
        } else if let cell = SubredditListTableViewCell.dequeue(for: indexPath, in: tableView), case let .post(data) = rowType {
            cell.setup(post: data)
            return cell
        }
        
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let .post(data) = viewModel.rows[safely: indexPath.row], let viewController = SubredditPostDetailsViewController.create(post: data) else {
            return
        }

        show(viewController, sender: nil)
    }
}
