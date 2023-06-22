//
//  TrendingRepositoriesRepoProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol TrendingRepositoriesRepoProtocol {
    func fetchRepositories(cachePolicy: CachePolicy, completion: @escaping (Result<TrendingRepositoriesResponse, Error>) -> ())
}
