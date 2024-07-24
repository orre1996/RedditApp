//
//  UINavigationBar+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

extension UINavigationBar {
    func changeNavigationBarColor(to color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        standardAppearance = appearance
        scrollEdgeAppearance = self.standardAppearance
    }
    
    func setBackButtonTitle(_ title: String) {
        let backButton = UIBarButtonItem()
        backButton.title = title
        topItem?.backBarButtonItem = backButton
    }
}
