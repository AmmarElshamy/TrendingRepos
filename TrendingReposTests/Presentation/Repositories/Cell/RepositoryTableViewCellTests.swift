//
//  RepositoryTableViewCellTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
import UIKit
@testable import TrendingRepos

final class RepositoryTableViewCellTests: XCTestCase {
    typealias ViewModel = RepositoryTableViewCell.ViewModel
    
    var sut: RepositoryTableViewCell!

    override func setUp() {
        sut = RepositoryTableViewCell.loadNib()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testRepositoryCell_whenLayoutSubviewsIsCalled_avatarImageViewIsCircular() {
        // When
        sut.layoutSubviews()
        
        // Then
        XCTAssertTrue(sut.avatarImageView.isCircular)
    }
    
    func testRepositoryCell_whenLayoutSubviewsIsCalled_languageBulletViewIsCircular() {
        // When
        sut.layoutSubviews()
        
        // Then
        XCTAssertTrue(sut.languageBulletView.isCircular)
    }
    
    func testRepositoryCell_whenBindViewModel_ownerTitleIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(ownerName: "Ammar")
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertEqual(sut.ownerNameLabel.text, viewModel.ownerName)
    }
    
    func testRepositoryCell_whenBindViewModel_ownerRepoTitleIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(title: "Trending Repo")
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertEqual(sut.titleLabel.text, viewModel.title)
    }
    
    func testRepositoryCell_whenBindViewModel_descriptionIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(description: "description")
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertEqual(sut.descriptionLabel.text, viewModel.description)
    }
    
    func testRepositoryCell_whenBindViewModel_languageIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(language: "python")
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertEqual(sut.languageLabel.text, viewModel.language)
    }
    
    func testRepositoryCell_whenBindViewModel_starsCountIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(starsCount: "100")
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertEqual(sut.starsCountLabel.text, viewModel.starsCount)
    }
    
}
