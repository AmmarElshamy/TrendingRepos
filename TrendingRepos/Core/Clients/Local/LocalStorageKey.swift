//
//  LocalStorageKey.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol LocalStorageKey {
    var rawValue: String { get }
}

extension String: LocalStorageKey {
    var rawValue: String {
        self
    }
}
