//
//  TrendingRepositoriesRepoSpy.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation
@testable import TrendingRepos

final class TrendingRepositoriesRepoSpy {
    private(set) var fetchRepositoriesCallsCount = 0
    private(set) var cachePolicy: CachePolicy?
    var result: Result<TrendingRepos.TrendingRepositoriesResponse, Error>?
}

extension TrendingRepositoriesRepoSpy: TrendingRepositoriesRepoProtocol {
    func fetchRepositories(cachePolicy: CachePolicy, completion: @escaping (Result<TrendingRepos.TrendingRepositoriesResponse, Error>) -> ()) {
        fetchRepositoriesCallsCount += 1
        self.cachePolicy = cachePolicy
        if let result {
            completion(result)
        }
    }
}
