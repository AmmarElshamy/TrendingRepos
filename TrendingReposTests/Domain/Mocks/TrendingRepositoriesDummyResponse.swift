//
//  TrendingRepositoriesDummyResponse.swift
//  TrendingReposTests
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation
@testable import TrendingRepos

extension TrendingRepositoriesResponse {
    static var dummy: Self {
        .init(repositories: .init(repeating: .dummy, count: 5))
    }
}

extension TrendingRepository {
    static var dummy: Self {
        .init(id: 134, title: "dummy", owner: .dummy, description: "No description", language: "Java", starsCount: 501)
    }
}

extension RepositoryOwner {
    static var dummy: Self {
        .init(id: 11, name: "Ammar", avatarURL: "avatar.com")
    }
}
