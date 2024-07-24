//
//  Array+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

extension Array {
    subscript(safely index: Int) -> Element? {
        guard index >= 0, index < endIndex else { return nil }
        
        return self[index]
    }
}
