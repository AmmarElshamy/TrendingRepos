//
//  Int+ToString.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

extension Optional {
    var toString: String? {
        switch self {
        case .none:
            return nil
        case let .some(value):
            return "\(value)"
        }
    }
}
