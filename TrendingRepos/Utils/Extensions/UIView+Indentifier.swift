//
//  UIView+Indentifier.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

public extension UIView {
    class var identifier: String {
        String(describing: self)
    }
}
