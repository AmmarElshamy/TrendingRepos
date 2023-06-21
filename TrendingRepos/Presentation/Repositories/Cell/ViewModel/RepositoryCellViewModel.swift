//
//  RepositoryCellViewModel.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

typealias ViewModel = RepositoryTableViewCell.ViewModel

// MARK: - Model
extension RepositoryTableViewCell {
    struct ViewModel: Equatable {
        let avatarURL: String?
        let ownerName: String
        let title: String
        let description: String?
        let language: String?
        let starsCount: String?
        var isExpanded: Bool
    }
}

// MARK: - Wrapper
extension RepositoryTableViewCell.ViewModel {
    var wrapped: ViewModelState<Self> {
        .data(self)
    }
}
