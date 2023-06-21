//
//  TrendingRepositoriesUseCaseSpy.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation
@testable import TrendingRepos

final class TrendingRepositoriesUseCaseSpy {
    private(set) var fetchRepositoriesCallsCount = 0
    var result: Result<TrendingRepos.TrendingRepositoriesResponse, Error>?
}

extension TrendingRepositoriesUseCaseSpy: TrendingRepositoriesUseCaseProtocol {
    func fetchRepositories(completion: @escaping (Result<TrendingRepos.TrendingRepositoriesResponse, Error>) -> ()) {
        fetchRepositoriesCallsCount += 1
        if let result {
            completion(result)
        }
    }
}
