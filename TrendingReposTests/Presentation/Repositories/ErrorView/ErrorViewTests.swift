//
//  ErrorViewTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import XCTest
@testable import TrendingRepos

final class ErrorViewTests: XCTestCase {
    
    private var sut: ErrorView!
    private var delegate: ErrorViewDelegateSpy!

    override func setUp() {
        sut = .init()
        delegate = .init()
        sut.delegate = delegate
    }
    
    override func tearDown() {
        delegate = nil
        sut = nil
    }
    
    func testErrorView_whenRetryButtonTapped_callsDelegateRetryMethod() {
        // When
        sut.retryButton.sendActions(for: .touchUpInside)
        
        // Then
        XCTAssertEqual(delegate.didTapRetryCallsCount, 1)
    }
}
