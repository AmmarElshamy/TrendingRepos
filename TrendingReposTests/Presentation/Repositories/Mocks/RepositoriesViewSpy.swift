//
//  RepositoriesViewSpy.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation
@testable import TrendingRepos

final class RepositoriesViewSpy {
    private(set) var updateStateCallsCount = 0
    private(set) var currentState: ViewState?
    private(set) var reloadItemCallsCount = 0
    private(set) var reloadedItemIndex: Int?
}

extension RepositoriesViewSpy: RepositoriesViewProtocol {
    func updateState(_ state: TrendingRepos.ViewState) {
        updateStateCallsCount += 1
        currentState = state
    }
    
    func reloadItem(at indexPath: IndexPath) {
        reloadItemCallsCount += 1
        reloadedItemIndex = nil
    }
}
