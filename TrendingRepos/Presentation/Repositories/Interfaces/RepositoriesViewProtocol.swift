//
//  RepositoriesViewProtocol.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

protocol RepositoriesViewProtocol: AnyObject {
    func updateState(_ state: ViewState)
    func reloadItem(at indexPath: IndexPath)
}
