//
//  TrendingRepositoriesUseCase.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

final class TrendingRepositoriesUseCase {
    private let repo: TrendingRepositoriesRepoProtocol
    
    init(repo: TrendingRepositoriesRepoProtocol) {
        self.repo = repo
    }
}

extension TrendingRepositoriesUseCase: TrendingRepositoriesUseCaseProtocol {
    func fetchRepositories(completion: @escaping (Result<TrendingRepositoriesResponse, Error>) -> ()) {
        repo.fetchRepositories(cachePolicy: .always) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    func refreshRepositories(completion: @escaping (Result<TrendingRepositoriesResponse, Error>) -> ()) {
        repo.fetchRepositories(cachePolicy: .remoteFirst) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
