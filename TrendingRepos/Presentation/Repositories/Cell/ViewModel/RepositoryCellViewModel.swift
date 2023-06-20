//
//  RepositoryCellViewModel.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

extension RepositoryTableViewCell {
    struct ViewModel: Equatable {
        let avatarURL: String?
        let ownerName: String
        let title: String
        let description: String?
        let language: String?
        let rating: String?
        var isExpanded: Bool
    }
}
