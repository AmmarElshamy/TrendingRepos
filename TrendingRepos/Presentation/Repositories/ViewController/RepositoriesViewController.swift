//
//  RepositoriesViewController.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

final class RepositoriesViewController: UIViewController {
     
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - CustomViews
    private var refreshControl: UIRefreshControl!
    
    private lazy var errorView = {
        let view = ErrorView()
        view.delegate = self
        return view
    }()
    
    // MARK: - Properties
    var presenter: RepositoriesPresenterProtocol!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupRefreshControl()
        presenter.viewDidLoad()
        setupTableView()
    }
}

// MARK: - Setup
private extension RepositoriesViewController {
    func setupTitle() {
        navigationItem.title = "Trending"
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: RepositoryTableViewCell.self)
    }
    
    func setupRefreshControl() {
        refreshControl = .init()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshData() {
        presenter.refreshData()
    }
}

// MARK: - TableViewDataSource
extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RepositoryTableViewCell = tableView.dequeue(cellFor: indexPath) else {
            return .init()
        }
        
        let viewModel = presenter.viewModel(for: indexPath)
        cell.bind(viewModel)
        return cell
    }
}

// MARK: - TableViewDelegate
extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

// MARK: - ViewProtocol
extension RepositoriesViewController: RepositoriesViewProtocol {
    func updateState(_ state: ViewState) {
        switch state {
        case .loading:
            tableView.backgroundView = nil
            tableView.isScrollEnabled = false
        case .success:
            tableView.backgroundView = nil
            tableView.isScrollEnabled = true
        case .failure:
            tableView.backgroundView = errorView
            break
        }
        
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    func reloadItem(at indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - ErrorViewDelegate
extension RepositoriesViewController: ErrorViewDelegate {
    func didTapRetry() {
        presenter.retry()
    }
}
