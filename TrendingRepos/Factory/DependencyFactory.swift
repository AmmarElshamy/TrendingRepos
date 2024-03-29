//
//  DependencyFactory.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

final class DependencyFactory: Factory {
    func createRepositoriesView() -> RepositoriesViewController {
        let viewController = RepositoriesViewController()
        let repo = TrendingRepositoriesRepo()
        let useCase = TrendingRepositoriesUseCase(repo: repo)
        let presenter = RepositoriesPresenter(view: viewController, useCase: useCase)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
