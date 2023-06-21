//
//  ViewModelState.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

enum ViewModelState<T: Equatable>: Equatable {
    case data(_ value: T)
    case skeleton
}

extension ViewModelState {
    var value: T? {
        guard case let .data(data) = self else { return nil }
        return data
    }
    
    var isSkeleton: Bool {
        guard case .skeleton = self else { return false }
        return true
    }
}
