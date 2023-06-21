//
//  RemoteDataSource.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

class RemoteDataSource: RemoteDataSourceProtocol {
    private let client: APIClient
    
    public init(client: APIClient = URLSession.shared) {
        self.client = client
    }
    
    public func getData<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        client.perform(endpoint.urlRequest, completion: completion)
    }
}
