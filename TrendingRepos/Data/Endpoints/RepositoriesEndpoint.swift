//
//  RepositoriesEndpoint.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

enum RepositoriesEndpoint {
    case trending
}

extension RepositoriesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .trending:
            return "/search/repositories"
        }
    }
    
    var params: [String : String]? {
        switch self {
        case .trending:
            return ["q": "language=+sort:stars"]
        }
    }
}
