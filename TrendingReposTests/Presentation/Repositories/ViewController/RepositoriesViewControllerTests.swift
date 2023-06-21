//
//  RepositoriesViewControllerTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
@testable import TrendingRepos

final class RepositoriesViewControllerTests: XCTestCase {
    
    typealias ViewModel = RepositoryTableViewCell.ViewModel
    
    var sut: RepositoriesViewController!
    var presenter: RepositoriesPresenterStub!

    override func setUp() {
        sut = .init()
        presenter = RepositoriesPresenterStub()
        sut.presenter = presenter
    }

    override func tearDown() {
        presenter = nil
        sut = nil
    }
    
    func testViewController_whenViewDidLoad_tableViewDisplaysRightNumberOfCells() {
        // Given
        let viewModels = [ViewModel](repeating: .stub(), count: 5)
        presenter.viewModels = viewModels
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        let numberOfItems = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfItems, viewModels.count)
    }
    
    func testViewController_whenViewDidLoad_andViewModelsExist_dequeuesRepositoryCell() {
        // Given
        let viewModel: ViewModel = .stub()
        presenter.viewModels = [viewModel]
        
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
        presenter.viewModels = [viewModel]

        // When
        sut.loadViewIfNeeded()
        
        // Then
        let cell = sut.tableView(sut.tableView,
                                 cellForRowAt: .init(row: 0, section: 0)) as? RepositoryTableViewCell
        XCTAssertEqual(cell?.ownerNameLabel.text, viewModel.ownerName)
        XCTAssertEqual(cell?.titleLabel.text, viewModel.title)
    }
}
