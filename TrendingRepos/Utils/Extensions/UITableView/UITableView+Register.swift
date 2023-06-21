//
//  UITableView+Register.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(UINib(nibName: cell.identifier, bundle: nil),
                 forCellReuseIdentifier: cell.identifier)
    }
}
