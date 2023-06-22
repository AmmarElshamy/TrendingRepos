//
//  RepositoriesPresenterTests.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import XCTest
@testable import TrendingRepos

final class RepositoriesPresenterTests: XCTestCase {
    
    private var sut: RepositoriesPresenter!
    private var view: RepositoriesViewSpy!
    private var useCase: TrendingRepositoriesUseCaseSpy!
    
    override func setUp() {
        view = .init()
        useCase = .init()
        sut = .init(view: view, useCase: useCase)
    }

    override func tearDown() {
        view = nil
        sut = nil
    }
    
    func testPresenter_whenViewDidLoadCalled_setsSkeletonViewModels() {
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
    
    func testPresenter_whenViewDidLoadCalled_fetchsRepositories() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(useCase.fetchRepositoriesCallsCount, 1)
    }
    
    func testPresenter_whenRetryCalled_setsSkeletonViewModels() {
        // When
        sut.retry()
        
        // Then
        let itemsCount = 8
        XCTAssertEqual(sut.numberOfItems, itemsCount)
        
        for index in 0..<itemsCount {
            let viewModel = sut.viewModel(for: IndexPath(row: index, section: 0))
            XCTAssertEqual(viewModel, .skeleton)
        }
    }
    
    func testPresenter_whenRetryCalled_setsLoadingViewState() {
        // When
        sut.retry()
        
        // Then
        XCTAssertEqual(view.updateStateCallsCount, 1)
        XCTAssertEqual(view.currentState, .loading)
    }
    
    func testPresenter_whenRetryCalled_fetchsRepositories() {
        // When
        sut.retry()
        
        // Then
        XCTAssertEqual(useCase.fetchRepositoriesCallsCount, 1)
    }
    
    func testPresenter_whenFetchesRepositoriesSucceeds_setsResponseViewModels() {
        // Given
        let response: TrendingRepositoriesResponse = .dummy
        let viewModels = response.viewModels
        useCase.result = .success(response)
        
        // When
        sut.viewDidLoad()
        
        // Then
        let itemsCount = response.repositories.count
        XCTAssertEqual(sut.numberOfItems, itemsCount)
        
        for index in 0..<itemsCount {
            let viewModel = sut.viewModel(for: IndexPath(row: index, section: 0))
            XCTAssertEqual(viewModel, viewModels[index])
        }
    }
    
    func testPresenter_whenFetchesRepositoriesSucceeds_setsSuccessViewState() {
        // Given
        let response: TrendingRepositoriesResponse = .dummy
        useCase.result = .success(response)
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(view.updateStateCallsCount, 2)
        XCTAssertEqual(view.currentState, .success)
    }
    
    func testPresenter_whenFetchesRepositoriesFails_removesViewModels() {
        // Given
        let response: TestingError = .dummy
        useCase.result = .failure(response)
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(sut.numberOfItems, 0)
    }
    
    func testPresenter_whenFetchesRepositoriesFails_setsFailureViewState() {
        // Given
        let response: TestingError = .dummy
        useCase.result = .failure(response)
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(view.updateStateCallsCount, 2)
        XCTAssertEqual(view.currentState, .failure)
    }
    
    func testPresenter_whenSkeletonItemIsSelected_doesNothing() {
        // When
        sut.viewDidLoad()
        sut.didSelectItem(at: .init(row: 0, section: 0))
        
        // Then
        XCTAssertEqual(view.reloadItemCallsCount, 0)
    }
    
    func testPresenter_whenRepositoryItemIsSelected_callsChangesItemExpansionState() {
        // Given
        let response: TrendingRepositoriesResponse = .dummy
        let selectedIndex = 0
        useCase.result = .success(response)
        
        // When
        sut.viewDidLoad()
        sut.didSelectItem(at: .init(row: selectedIndex, section: 0))
        
        // Then
        let item = sut.viewModel(for: .init(item: selectedIndex, section: 0)).value
        XCTAssertEqual(item?.isExpanded, true)
        XCTAssertEqual(view.reloadItemCallsCount, 1)
        XCTAssertEqual(view.reloadedItemIndex, selectedIndex)
    }
    
}

// MARK: - Helpers
private extension TrendingRepositoriesResponse {
    var viewModels: [ViewModelState<ViewModel>] {
        repositories.compactMap { $0.uiModel?.wrapped }
    }
}

private extension TrendingRepository {
    var uiModel: ViewModel? {
        guard let ownerName = owner?.name, let title else { return nil }
        
        return .init(avatarURL: owner?.avatarURL,
                     ownerName: ownerName,
                     title: title,
                     description: description,
                     language: language,
                     starsCount: starsCount.toString,
                     isExpanded: false)
    }
}
