//
//  RepositoriesPresenterTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
@testable import TrendingRepos

final class RepositoriesPresenterTests: XCTestCase {
    
    var sut: RepositoriesPresenter!
    var view: RepositoriesViewSpy!
    
    override func setUp() {
        view = .init()
        sut = .init(view: view)
    }

    override func tearDown() {
        view = nil
        sut = nil
    }
    
    func testPresenter_whenViewDidLoadCalled_setSkeletonViewModels() {
        // When
        sut.viewDidLoad()
        
        // Then
        let itemsCount = 8
        XCTAssertEqual(sut.numberOfItems, itemsCount)
        
        for index in 0..<itemsCount {
            let viewModel = sut.viewModel(for: IndexPath(row: index, section: 0))
            XCTAssertEqual(viewModel, .skeleton)
        }
    }
    
    func testPresenter_whenViewDidLoadCalled_setsLoadingViewState() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(view.updateStateCallsCount, 1)
        XCTAssertEqual(view.currentState, .loading)
    }
    
    func testPresenter_whenSkeletonItemIsSelected_doesNothing() {
        // When
        sut.viewDidLoad()
        sut.didSelectItem(at: .init(row: 0, section: 0))
        
        // Then
        XCTAssertEqual(view.reloadItemCallsCount, 0)
    }

}
