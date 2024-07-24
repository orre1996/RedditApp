//
//  SubredditListViewController.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit
import Combine

class SubredditListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let viewModel = SubredditListViewModel()

    override func viewDidLoad() {
        configureTableView()
        customizeNavigationBar()
        registerCells()
        downloadSubredditData()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        tableView.addRefreshControl(target: self, selector: #selector(reloadFromRefresh))
    }

    private func customizeNavigationBar() {
        title = "r/\(viewModel.selectedSubreddit.rawValue)"
        navigationController?.navigationBar.changeNavigationBarColor(to: .navigationBarBackgroundColor)
        navigationController?.navigationBar.setBackButtonTitle("Back")
    }
    
    private func registerCells() {
        SubredditListTableViewCell.register(in: tableView)
        ErrorTableViewCell.register(in: tableView)
    }

    private func downloadSubredditData() {
        tableView.refreshControl?.beginRefreshing()
        
        Task {
            await viewModel.getSubreddit(.swiftui)
            tableView.reloadData()
        }
    }
    
    @objc
    private func reloadFromRefresh() {
        Task {
            await viewModel.getSubreddit(Subreddit.randomSubreddit)
            tableView.reloadData()
            tableView.refreshControl?.endRefreshing()
            title = "r/\(viewModel.selectedSubreddit.rawValue)"
        }
    }
}
