//
//  RepositoriesViewControllerTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
@testable import TrendingRepos

final class RepositoriesViewControllerTests: XCTestCase {
    
    var sut: RepositoriesViewController!

    override func setUp() {
        sut = .init()
    }

    override func tearDown() {
        sut = nil
    }
}
