//
//  UIFont+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

extension UIFont {
    func makeScalable() -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .body)
        return metrics.scaledFont(for: self)
    }
}

extension UILabel {
    func makeFontScalable(font: UIFont) {
        let metrics = UIFontMetrics(forTextStyle: .body)
        self.font = metrics.scaledFont(for: font)
    }
}
