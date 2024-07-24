//
//  TestDataManager.swift
//  RedditAppTests
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation
@testable import RedditApp

class TestDataManager {
    private let decoder = JSONDecoder()

    func getResultFromFile<T>(filePath path: String) -> T? where T: Codable {
        guard let data = getLocalTestAsset(forPath: path) else { return nil }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }

    func getLocalTestAsset(forPath path: String) -> Data? {
        if let path = Bundle(for: TestDataManager.self).path(forResource: path, ofType: ""), let file = FileManager().contents(atPath: path) {
            return file as Data?
        }

        return nil
    }
}

extension TestDataManager {
    var swiftUIPosts: SubredditResponse {
        getResultFromFile(filePath: "SwiftUIPosts.json")!
    }
}