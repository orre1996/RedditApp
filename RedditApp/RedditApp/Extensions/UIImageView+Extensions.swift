//
//  UIImageView+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import UIKit

extension UIImageView {
    func downloadImage(from url: URL) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            guard let createdImage = UIImage(data: data) else {
                image = .warning
                contentMode = .scaleAspectFit
                return
            }

            image = createdImage
            contentMode = .scaleAspectFill
        } catch {
            image = .warning
            contentMode = .scaleAspectFit
        }
    }
}
