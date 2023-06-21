//
//  LocalStorageClient.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol LocalStorageClient {
    func object<T: Decodable>(key: LocalStorageKey) -> T?
    func write<T: Encodable>(key: LocalStorageKey, object: T?)
}
