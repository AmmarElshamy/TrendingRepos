//
//  TrendingRepositoriesResponse.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import Foundation

struct TrendingRepositoriesResponse: Codable, Equatable {
    let repositories: [TrendingRepository]
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}

struct TrendingRepository: Codable, Equatable {
    let id: Int
    let title: String?
    let owner: RepositoryOwner?
    let description: String?
    let language: String?
    let starsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, owner, description, language
        case title = "name"
        case starsCount = "stargazersCount"
    }
}

struct RepositoryOwner: Codable, Equatable {
    let id: Int
    let name: String?
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarURL = "avatarUrl"
    }
}
