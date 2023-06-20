//
//  RepositoryTableViewCellTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
@testable import TrendingRepos

final class RepositoryTableViewCellTests: XCTestCase {

    var sut: RepositoryTableViewCell!

    override func setUp() {
        sut = RepositoryTableViewCell.loadNib()
    }

    override func tearDown() {
        sut = nil
    }
    
}
