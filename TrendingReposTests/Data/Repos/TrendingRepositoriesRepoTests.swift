//
//  TrendingRepositoriesRepoTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import XCTest
@testable import TrendingRepos

final class TrendingRepositoriesRepoTests: XCTestCase {
    
    private var sut: TrendingRepositoriesRepo!
    private var localDataSource: LocalDataSourceSpy<TrendingRepositoriesResponse>!
    private var remoteDataSource: RemoteDataSourceSpy<TrendingRepositoriesResponse>!
    
    override func setUp() {
        localDataSource = .init()
        remoteDataSource = .init()
        sut = .init(local: localDataSource, remote: remoteDataSource)
    }
    
    override func tearDown() {
        localDataSource = nil
        remoteDataSource = nil
        sut = nil
    }
    
    // MARK: - Always Cache Policy
    func testRepo_whenFetchRepositoriesCalled_withAlwaysCachePolicy_getsDataFromLocalSourceFirst() {
        // Given
        let expectedEndpoint = RepositoriesEndpoint.trending
        
        // When
        sut.fetchRepositories(cachePolicy: .always) { _ in }
        
        // Then
        XCTAssertEqual(localDataSource.getDataCallsCount, 1)
        XCTAssertEqual(localDataSource.endpoint as? RepositoriesEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withAlwaysCachePolicy_andCachedData_excutesCompletion() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .success(.dummy)
        localDataSource.result = result
        var didExcuteCompletion = false
        
        // When
        sut.fetchRepositories(cachePolicy: .always) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withAlwaysCachePolicy_andNoCachedData_getsDataFromRemoteSource() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        let expectedEndpoint = RepositoriesEndpoint.trending

        // When
        sut.fetchRepositories(cachePolicy: .always) { _ in }
        
        // Then
        XCTAssertEqual(remoteDataSource.getDataCallsCount, 1)
        XCTAssertEqual(remoteDataSource.endpoint as? RepositoriesEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withAlwaysCachePolicy_noCachedData_andSuccessRemoteResponse_savesData() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        let remoteResult: Result<TrendingRepositoriesResponse, Error> = .success(.dummy)
        remoteDataSource.result = remoteResult
        let expectedEndpoint = RepositoriesEndpoint.trending
        
        // When
        sut.fetchRepositories(cachePolicy: .always) { _ in }
        
        // Then
        XCTAssertEqual(localDataSource.saveDataCallsCount, 1)
        XCTAssertEqual(remoteDataSource.endpoint as? RepositoriesEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withAlwaysCachePolicy_noCachedData_andSuccessRemoteResponse_excutesCompletion() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        let remoteResult: Result<TrendingRepositoriesResponse, Error> = .success(.dummy)
        remoteDataSource.result = remoteResult
        var didExcuteCompletion = false
        
        // When
        sut.fetchRepositories(cachePolicy: .always) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withAlwaysCachePolicy_noCachedData_andFailureRemoteResponse_excutesCompletion() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        remoteDataSource.result = result
        var didExcuteCompletion = false

        
        // When
        sut.fetchRepositories(cachePolicy: .always) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    // MARK: - Remote First Cache Policy
    func testRepo_whenFetchRepositoriesCalled_withRemoteFirstCachePolicy_getsDataFromRemoteSourceFirst() {
        // Given
        let expectedEndpoint = RepositoriesEndpoint.trending
        
        // When
        sut.fetchRepositories(cachePolicy: .remoteFirst) { _ in }
        
        // Then
        XCTAssertEqual(remoteDataSource.getDataCallsCount, 1)
        XCTAssertEqual(remoteDataSource.endpoint as? RepositoriesEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withRemoteFirstCachePolicy_andSuccessResponse_savesData() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .success(.dummy)
        remoteDataSource.result = result
        let expectedEndpoint = RepositoriesEndpoint.trending
        
        // When
        sut.fetchRepositories(cachePolicy: .remoteFirst) { _ in }
        
        // Then
        XCTAssertEqual(localDataSource.saveDataCallsCount, 1)
        XCTAssertEqual(remoteDataSource.endpoint as? RepositoriesEndpoint, expectedEndpoint)
    }

    func testRepo_whenFetchRepositoriesCalled_withRemoteFirstCachePolicy_andSuccessResponse_excutesCompletion() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .success(.dummy)
        remoteDataSource.result = result
        var didExcuteCompletion = false
        
        // When
        sut.fetchRepositories(cachePolicy: .remoteFirst) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withRemoteFirstCachePolicy_andFailureResponse_getsDataFromLocalSourceFirst() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        remoteDataSource.result = result
        let expectedEndpoint = RepositoriesEndpoint.trending
        
        // When
        sut.fetchRepositories(cachePolicy: .remoteFirst) { _ in }
        
        // Then
        XCTAssertEqual(localDataSource.getDataCallsCount, 1)
        XCTAssertEqual(localDataSource.endpoint as? RepositoriesEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withRemoteFirstCachePolicy_failureResponse_andCachedData_excutesCompletion() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        remoteDataSource.result = result
        let localResult: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        localDataSource.result = localResult
        var didExcuteCompletion = false
        
        // When
        sut.fetchRepositories(cachePolicy: .remoteFirst) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchRepositoriesCalled_withRemoteFirstCachePolicy_failureResponse_andNoCachedData_excutesCompletion() {
        // Given
        let result: Result<TrendingRepositoriesResponse, Error> = .failure(TestingError.dummy)
        remoteDataSource.result = result
        localDataSource.result = result
        var didExcuteCompletion = false
        
        // When
        sut.fetchRepositories(cachePolicy: .remoteFirst) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
}
