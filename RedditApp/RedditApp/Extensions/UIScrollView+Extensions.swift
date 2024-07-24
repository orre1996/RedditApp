//
//  UIScrollView+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

extension UIScrollView {
  func addRefreshControl(target: Any, selector: Selector, title: String? = nil) {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(target, action: selector, for: .valueChanged)

    if let attributedTitle = title {
      refreshControl.attributedTitle = NSAttributedString(string: attributedTitle)
    }

    self.refreshControl = refreshControl
  }
}
