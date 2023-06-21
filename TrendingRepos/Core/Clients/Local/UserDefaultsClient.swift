//
//  UserDefaultsClient.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

extension UserDefaults: LocalStorageClient {
    func object<T: Decodable>(key: LocalStorageKey) -> T? {
        data(forKey: key.rawValue)?.decoded()
    }
    
    func write<T: Encodable>(key: LocalStorageKey, object: T?) {
        set(object?.data, forKey: key.rawValue)
    }
}
