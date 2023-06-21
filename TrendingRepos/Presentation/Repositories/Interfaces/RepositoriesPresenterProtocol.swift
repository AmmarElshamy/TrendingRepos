//
//  RepositoriesPresenterProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

protocol RepositoriesPresenterProtocol: AnyObject {
    var numberOfItems: Int { get }
    func viewModel(for indexPath: IndexPath) -> RepositoryTableViewCell.ViewModel
}
