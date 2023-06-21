//
//  RepositoriesViewControllerTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
@testable import TrendingRepos

final class RepositoriesViewControllerTests: XCTestCase {
        
    private var sut: RepositoriesViewController!
    private var presenter: RepositoriesPresenterSpy!

    override func setUp() {
        sut = .init()
        presenter = .init()
        sut.presenter = presenter
    }

    override func tearDown() {
        presenter = nil
        sut = nil
    }
    
    func testViewController_whenViewDidLoad_setsTitle() {
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.navigationItem.title, "Trending")
    }
    
    func testViewController_whenViewDidLoad_callsViewDidLoad() {
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(presenter.viewDidLoadCallsCount, 1)
    }
    
    func testViewController_whenViewDidLoad_tableViewDisplaysRightNumberOfCells() {
        // Given
        let viewModels = [ViewModel](repeating: .stub(), count: 5)
        presenter.viewModels = viewModels.map { $0.wrapped }
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        let numberOfItems = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfItems, viewModels.count)
    }
    
    func testViewController_whenViewDidLoad_andViewModelsExist_dequeuesRepositoryCell() {
        // Given
        let viewModel: ViewModel = .stub()
        presenter.viewModels = [viewModel.wrapped]
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        let cell = sut.tableView(sut.tableView,
                                 cellForRowAt: .init(row: 0, section: 0))
        XCTAssertNotNil(cell as? RepositoryTableViewCell)
    }
    
    func testViewController_whenViewDidLoad_tableViewDisplaysLoadedModels() {
        // Given
        let viewModel: ViewModel = .stub(ownerName: "Ammar", title: "Trending")
        presenter.viewModels = [viewModel.wrapped]

        // When
        sut.loadViewIfNeeded()
        
        // Then
        let cell = sut.tableView(sut.tableView,
                                 cellForRowAt: .init(row: 0, section: 0)) as? RepositoryTableViewCell
        XCTAssertEqual(cell?.ownerNameLabel.text, viewModel.ownerName)
        XCTAssertEqual(cell?.titleLabel.text, viewModel.title)
    }
    
    func testViewController_whenItemIsSelected_callsDidSelectItem() {
        // Given
        let indexPath = IndexPath(row: 5, section: 0)
        
        // When
        sut.loadViewIfNeeded()
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)
        
        // Then
        XCTAssertEqual(presenter.didSelectItemCallsCount, 1)
        XCTAssertEqual(presenter.selectedItemIndex, indexPath.row)
    }
    
    func testViewController_whenStateIsLoading_hidesErrorView() {
        // When
        sut.loadViewIfNeeded()
        sut.updateState(.loading)
        
        // Then
        XCTAssertNil(sut.tableView.backgroundView)
    }
    
    func testViewController_whenStateIsLoading_reloadsTableView() {
        // When
        sut.loadViewIfNeeded()
        sut.updateState(.loading)
        
        // Then
        XCTAssertEqual(presenter.numberOfItemsCallsCount, 1)
    }
    
    func testViewController_whenStateIsSuccess_hidesErrorView() {
        // When
        sut.loadViewIfNeeded()
        sut.updateState(.success)
        
        // Then
        XCTAssertNil(sut.tableView.backgroundView)
    }
    
    func testViewController_whenStateIsSuccess_reloadsTableView() {
        // When
        sut.loadViewIfNeeded()
        sut.updateState(.success)
        
        // Then
        XCTAssertEqual(presenter.numberOfItemsCallsCount, 1)
    }
    
    func testViewController_whenStateIsFailure_showsErrorView() {
        // When
        sut.loadViewIfNeeded()
        sut.updateState(.failure)
        
        // Then
        XCTAssertTrue(sut.tableView.backgroundView is ErrorView)
    }
    
    func testViewController_whenStateIsFailure_reloadsTableView() {
        // When
        sut.loadViewIfNeeded()
        sut.updateState(.failure)
        
        // Then
        XCTAssertEqual(presenter.numberOfItemsCallsCount, 1)
    }
}
