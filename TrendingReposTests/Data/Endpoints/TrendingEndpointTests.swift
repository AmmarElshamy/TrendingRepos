//
//  TrendingEndpointTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import XCTest
@testable import TrendingRepos

final class TrendingEndpointTests: XCTestCase {
    
    func testTrendingEndpoint_usesCorrectBaseURL() {
        // Given
        let baseURL = RepositoriesEndpoint.trending.baseURL
        
        // Then
        XCTAssertEqual(baseURL, NetworkConstants.baseURL)
    }
    
    func testTrendingEndpoint_usesCorrectPath() {
        // Given
        let trendingRepositoriesPath = "/search/repositories"
        let path = RepositoriesEndpoint.trending.path
        
        // Then
        XCTAssertEqual(path, trendingRepositoriesPath)
    }
    
    func testTrendingEndpoint_usesCorrectQueryPrameters() {
        // Given
        let trendingRepositoriesParams = ["q": "language=+sort:stars"]
        let parameters = RepositoriesEndpoint.trending.params
        
        // Then
        XCTAssertEqual(parameters, trendingRepositoriesParams)
    }
    
    func testTrendingEndpoint_usesGetMethod() {
        // Given
        let method = RepositoriesEndpoint.trending.method
        
        // Then
        XCTAssertEqual(method, .GET)
    }
    
}
