//
//  NSObject+Extensions.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

extension NSObject {
  class var classIdentifier: String {
    return String(describing: self)
  }
}
