//
//  NetworkError.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidStatusCode
    case invalidResponse
}
