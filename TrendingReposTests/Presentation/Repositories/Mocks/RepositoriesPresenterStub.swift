//
//  RepositoriesPresenterStub.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation
@testable import TrendingRepos

final class RepositoriesPresenterStub {
    var viewModels: [RepositoryTableViewCell.ViewModel] = []
}

extension RepositoriesPresenterStub: RepositoriesPresenterProtocol {
    var numberOfItems: Int {
        viewModels.count
    }
    
    func viewModel(for indexPath: IndexPath) -> TrendingRepos.RepositoryTableViewCell.ViewModel {
        viewModels[indexPath.row]
    }
}
