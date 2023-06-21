//
//  TrendingRepositoriesRepoProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol TrendingRepositoriesRepoProtocol {
    func fetchRepositories(completion: @escaping (Result<TrendingRepositoriesResponse, Error>) -> ())
}
