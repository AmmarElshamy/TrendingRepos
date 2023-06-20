//
//  Coordinator.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 20/06/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    init(navigationController: UINavigationController)
    func start()
}
