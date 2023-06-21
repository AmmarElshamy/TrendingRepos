//
//  UITableView+Dequeue.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cellFor indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}
