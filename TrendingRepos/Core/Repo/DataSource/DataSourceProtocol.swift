//
//  DataSourceProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol DataSourceProtocol {
    func getData<T: Codable>(endpoint: Endpoint, completion:  @escaping (Result<T, Error>) -> Void)
}
