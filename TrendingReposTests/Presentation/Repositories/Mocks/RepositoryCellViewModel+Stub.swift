//
//  RepositoryCellViewModel+Stub.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation
@testable import TrendingRepos

extension RepositoryTableViewCell.ViewModel {
    static func stub(avatarURL: String? = nil,
              ownerName: String = "",
              title: String = "",
              description: String? = nil,
              language: String? = nil,
              starsCount: String? = nil,
              isExpanded: Bool = false) -> Self {
        
        .init(avatarURL: avatarURL,
              ownerName: ownerName,
              title: title,
              description: description,
              language: language,
              starsCount: starsCount,
              isExpanded: isExpanded)
    }
}
