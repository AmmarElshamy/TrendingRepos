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
    
    // MARK: - Properties
    var presenter: RepositoriesPresenterProtocol!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupTableView()
    }
}

// MARK: - Setup
private extension RepositoriesViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: RepositoryTableViewCell.self)
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
        case .loading, .success:
            tableView.backgroundView = nil
        case .failure:
            // TODO: present error view
            tableView.backgroundView = UIView()
            break
        }
        
        tableView.reloadData()
    }
    
    func reloadItem(at indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
