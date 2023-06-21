//
//  TrendingRepositoriesUseCaseProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol TrendingRepositoriesUseCaseProtocol {
    func fetchRepositories(completion: @escaping (Result<TrendingRepositoriesResponse, Error>) -> ())
}
