//
//  ErrorViewDelegateSpy.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation
@testable import TrendingRepos

final class ErrorViewDelegateSpy {
    private(set) var didTapRetryCallsCount = 0
}

extension ErrorViewDelegateSpy: ErrorViewDelegate {
    func didTapRetry() {
        didTapRetryCallsCount += 1
    }
}
