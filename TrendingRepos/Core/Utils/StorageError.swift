//
//  StorageError.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 22/06/2023.
//

import Foundation

enum StorageError {
    case unavailabeResources
}

extension StorageError: Error {
    public var localizedDescription: String {
        switch self {
        case .unavailabeResources:
            return NSLocalizedString("The resource you requested could not be found.",
                                     comment: "No Data")
        }
    }
}
