//
//  NetworkError.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

enum NetworkError: Error {
    case noData
    case networkError
    case invalidAPIKey
    case unKnown
}

extension NetworkError: LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .noData:
            return NSLocalizedString("The resource you requested could not be found.",
                                     comment: "No Data")
            
        case .networkError:
            return NSLocalizedString("Generic Network Error.",
                                     comment: "Network Error")
            
        case .invalidAPIKey:
            return NSLocalizedString("Invalid API key: You must be granted a valid key.",
                                     comment: "Invalid API Key")
            
        case .unKnown:
            return NSLocalizedString("Something Went Wrong",
                                     comment: "Unknow Error")
        }
    }
}
