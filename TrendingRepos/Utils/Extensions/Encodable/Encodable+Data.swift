//
//  Encodable+Data.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

extension Encodable {
    var data: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
