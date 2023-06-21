//
//  RepositoriesPresenter.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

final class RepositoriesPresenter {
    
    private weak var view: RepositoriesViewProtocol?
    private var viewModels: [ViewModelState<ViewModel>]
    
    init(view: RepositoriesViewProtocol) {
        self.view = view
        viewModels = []
    }
}

// MARK: - RepositoriesPresenterProtocol
extension RepositoriesPresenter: RepositoriesPresenterProtocol {
    var numberOfItems: Int {
        viewModels.count
    }
    
    func viewDidLoad() {
        handleLoadingState()
        // TODO: send request
    }
    
    func viewModel(for indexPath: IndexPath) -> ViewModelState<ViewModel> {
        viewModels[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard var item = viewModels[indexPath.row].value else { return }
        item.isExpanded.toggle()
        viewModels[indexPath.row] = item.wrapped
        view?.reloadItem(at: indexPath)
    }
}

// MARK: - States Handlers
private extension RepositoriesPresenter {
    func handleLoadingState() {
        viewModels = .init(repeating: .skeleton, count: 5)
        view?.updateState(.loading)
    }
}
