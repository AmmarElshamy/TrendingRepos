//
//  RemoteDataSourceSpy.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation
@testable import TrendingRepos

final class RemoteDataSourceSpy<U> {
    private(set) var getDataCallsCount = 0
    private(set) var endpoint: Endpoint?
    
    var result: Result<U, Error>?
}

extension RemoteDataSourceSpy: RemoteDataSourceProtocol {
    func getData<T>(endpoint: TrendingRepos.Endpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        getDataCallsCount += 1
        self.endpoint = endpoint
        
        if let result = result as? Result<T, Error> {
            completion(result)
        }
    }
}
