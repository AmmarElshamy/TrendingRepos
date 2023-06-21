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
    
    func testRepositoryCell_whenBindSkeletonModel_skeletonIsDispalyed() {
        // Given
        let viewModel: ViewModelState<ViewModel> = .skeleton
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertTrue(sut.avatarImageView.sk.isSkeletonActive)
        XCTAssertTrue(sut.ownerNameLabel.sk.isSkeletonActive)
        XCTAssertTrue(sut.titleLabel.sk.isSkeletonActive)
        XCTAssertTrue(sut.detailsStackView.isHidden)
    }
    
    func testRepositoryCell_whenBindSkeletonModel_userInteractionIsDisabled() {
        // Given
        let viewModel: ViewModelState<ViewModel> = .skeleton
        
        // When
        sut.bind(viewModel)
        
        // Then
        XCTAssertFalse(sut.isUserInteractionEnabled)
    }
    
    func testRepositoryCell_whenBindViewModel_skeletonIsHidden() {
        // Given
        let viewModel: ViewModel = .stub(isExpanded: true)
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertFalse(sut.avatarImageView.sk.isSkeletonActive)
        XCTAssertFalse(sut.ownerNameLabel.sk.isSkeletonActive)
        XCTAssertFalse(sut.titleLabel.sk.isSkeletonActive)
        XCTAssertEqual(sut.detailsStackView.isHidden, !viewModel.isExpanded)
    }
    
    func testRepositoryCell_whenBindSkeletonModel_userInteractionIsEnabled() {
        // Given
        let viewModel: ViewModel = .stub()
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertTrue(sut.isUserInteractionEnabled)
    }
    
    func testRepositoryCell_whenBindViewModel_ownerTitleIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(ownerName: "Ammar")
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertEqual(sut.ownerNameLabel.text, viewModel.ownerName)
    }
    
    func testRepositoryCell_whenBindViewModel_ownerRepoTitleIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(title: "Trending Repo")
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertEqual(sut.titleLabel.text, viewModel.title)
    }
    
    func testRepositoryCell_whenBindViewModel_descriptionIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(description: "description")
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertEqual(sut.descriptionLabel.text, viewModel.description)
    }
    
    func testRepositoryCell_whenBindViewModel_languageIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(language: "python")
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertEqual(sut.languageLabel.text, viewModel.language)
    }
    
    func testRepositoryCell_whenBindViewModel_starsCountIsDisplayed() {
        // Given
        let viewModel = ViewModel.stub(starsCount: "100")
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertEqual(sut.starsCountLabel.text, viewModel.starsCount)
    }
    
    func testRepositoryCell_whenBindViewModel_andCellIsCollapsed_detailsStackViewIsHidden() {
        // Given
        let viewModel = ViewModel.stub(isExpanded: false)
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertTrue(sut.detailsStackView.isHidden)
    }
    
    func testRepositoryCell_whenBindViewModel_andCellIsExpanded_detailsStackViewIsVisible() {
        // Given
        let viewModel = ViewModel.stub(isExpanded: true)
        
        // When
        sut.bind(viewModel.wrapped)
        
        // Then
        XCTAssertFalse(sut.detailsStackView.isHidden)
    }
    
}
