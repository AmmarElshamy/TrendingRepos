//
//  RepositoriesPresenterSpy.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation
@testable import TrendingRepos

final class RepositoriesPresenterSpy {
    
    private(set) var viewDidLoadCallsCount = 0
    private(set) var didSelectItemCallsCount = 0
    private(set) var selectedItemIndex: Int?
    
    var viewModels: [RepositoryTableViewCell.ViewModel] = []
}

extension RepositoriesPresenterSpy: RepositoriesPresenterProtocol {
    var numberOfItems: Int {
        viewModels.count
    }
    
    func viewDidLoad() {
        viewDidLoadCallsCount += 1
    }
    
    func viewModel(for indexPath: IndexPath) -> TrendingRepos.RepositoryTableViewCell.ViewModel {
        viewModels[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        didSelectItemCallsCount += 1
        selectedItemIndex = indexPath.row
    }
}
