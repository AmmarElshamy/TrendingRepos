//
//  NetworkConstantsTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import XCTest
@testable import TrendingRepos

final class NetworkConstantsTests: XCTestCase {
    func testNetworkConstants_baseURL() {
        let baseURL = "https://api.github.com/"
        XCTAssertEqual(NetworkConstants.baseURL, baseURL)
    }
}
