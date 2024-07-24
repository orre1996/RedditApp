//
//  ThreadHelper.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

func asyncMain(delay: Double = 0, _ block: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
    block()
  }
}
