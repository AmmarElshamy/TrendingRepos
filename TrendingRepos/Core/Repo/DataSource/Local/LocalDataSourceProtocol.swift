//
//  LocalDataSourceProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

protocol LocalDataSourceProtocol: DataSourceProtocol {
    func saveData<T: Codable>(endpoint: Endpoint, data: T, completion: @escaping (Result<T, Error>) -> Void)
}
