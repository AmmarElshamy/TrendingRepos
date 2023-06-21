//
//  CacheRepoProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol CacheRepoProtocol {
    associatedtype Local
    associatedtype Remote
    
    func getData<T: Codable>(endpoint: Endpoint, cachePolicy: CachePolicy, completion:  @escaping (Result<T, Error>) -> Void)
}
