//
//  RepositoriesPresenter.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

final class RepositoriesPresenter {
    
    private let useCase: TrendingRepositoriesUseCaseProtocol
    private weak var view: RepositoriesViewProtocol?
    private var viewModels: [ViewModelState<ViewModel>]
    
    init(view: RepositoriesViewProtocol, useCase: TrendingRepositoriesUseCaseProtocol) {
        self.view = view
        self.useCase = useCase
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
        fetchRepositories()
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

// MARK: - Data Fetching
private extension RepositoriesPresenter {
    func fetchRepositories() {
        useCase.fetchRepositories { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                handleSuccessState(repositories: response.repositories)
            case let .failure(error):
                print(error.localizedDescription)
                handleFailureState()
            }
        }
    }
}

// MARK: - States Handlers
private extension RepositoriesPresenter {
    func handleLoadingState() {
        viewModels = .init(repeating: .skeleton, count: 8)
        view?.updateState(.loading)
    }
    
    func handleSuccessState(repositories: [TrendingRepository]) {
        viewModels = repositories.compactMap { $0.uiModel?.wrapped }
        view?.updateState(.success)
    }
    
    func handleFailureState() {
        viewModels = []
        view?.updateState(.failure)
    }
}

// MARK: - Mapping
private extension TrendingRepository {
    var uiModel: ViewModel? {
        guard let ownerName = owner?.name, let title else { return nil }
        
        return .init(avatarURL: owner?.avatarURL,
                     ownerName: ownerName,
                     title: title,
                     description: description,
                     language: language,
                     starsCount: starsCount.toString,
                     isExpanded: false)
    }
}
