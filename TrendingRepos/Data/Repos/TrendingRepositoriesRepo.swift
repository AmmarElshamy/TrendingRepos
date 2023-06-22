//
//  TrendingRepositoriesRepo.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

final class TrendingRepositoriesRepo: CacheRepo { }

extension TrendingRepositoriesRepo: TrendingRepositoriesRepoProtocol {
    func fetchRepositories(cachePolicy: CachePolicy, completion: @escaping (Result<TrendingRepositoriesResponse, Error>) -> ()) {
        let endPoint = RepositoriesEndpoint.trending
        getData(endpoint: endPoint, cachePolicy: cachePolicy, completion: completion)
    }
}
