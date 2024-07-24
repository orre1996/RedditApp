//
//  SettingsManager.swift
//  RedditApp
//
//  Created by Oscar Berggren on 2024-07-24.
//

import Foundation

protocol SettingKeyable {
    var rawValue: String { get }
    var data: Data? { get }
}

enum EnvironmentSettingKey: String, SettingKeyable {
    case environment
    
    var data: Data? {
        return UserDefaults.standard.data(forKey: self.rawValue)
    }
}

class SettingsManager {
    static let shared = SettingsManager()

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    func get<T: Decodable>(key: SettingKeyable) -> T? {
        guard let data = key.data, let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }

        return object
    }

    func set<T: Encodable>(data: T, key: SettingKeyable) {
        guard let data = try? encoder.encode(data) else { return }

        UserDefaults.standard.set(data, forKey: key.rawValue)
    }
}
