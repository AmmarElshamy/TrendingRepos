//
//  TrendingRepositoriesUseCaseTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import XCTest
@testable import TrendingRepos

final class TrendingRepositoriesUseCaseTests: XCTestCase {
    
    private var sut: TrendingRepositoriesUseCase!
    private var repo: TrendingRepositoriesRepoSpy!

    override func setUp() {
        repo = .init()
        sut = .init(repo: repo)
    }
    
    override func tearDown() {
        repo = nil
        sut = nil
    }
    
    func testUseCase_whenFetchRepositoriesCalled_callsRepoFetchRepositories() {
        // When
        
        sut.fetchRepositories { _ in }
        
        // Then
        XCTAssertEqual(repo.fetchRepositoriesCallsCount, 1)
        XCTAssertEqual(repo.cachePolicy, .always)
    }
    
    func testUseCase_whenFetchRepositoriesCalled_withSuccessResponse_excutessCompletion() {
        // Given
        let expectation = expectation(description: "Use Case Success Response")
        let response: TrendingRepositoriesResponse = .dummy
        var expectedResponse: TrendingRepositoriesResponse?
        repo.result = .success(response)
        
        // When
        sut.fetchRepositories { result in
            switch result {
            case let .success(data):
                expectedResponse = data
                expectation.fulfill()
            case .failure:
                break
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(expectedResponse, response)
    }
    
    func testUseCase_whenFetchRepositoriesCalled_withFailureResponse_excutessCompletion() {
        // Given
        let expectation = expectation(description: "Use Case Success Response")
        let error: TestingError = .dummy
        var expectedError: TestingError?
        repo.result = .failure(error)
        
        // When
        sut.fetchRepositories { result in
            switch result {
            case .success:
                break
            case .failure:
                expectedError = error
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(expectedError, error)
    }
}
