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
        let presenter = RepositoriesPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
