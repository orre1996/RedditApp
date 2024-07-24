//
//  UITableViewCell+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

extension UITableViewCell {
    static func dequeue(for indexPath: IndexPath, in tableView: UITableView) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: classIdentifier, for: indexPath) as? Self
    }

    static func register(in tableView: UITableView) {
        tableView.register(UINib(nibName: classIdentifier, bundle: nil), forCellReuseIdentifier: classIdentifier)
    }
}
