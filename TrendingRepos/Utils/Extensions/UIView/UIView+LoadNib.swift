//
//  UIView+LoadNib.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

public extension UIView {
    static func loadNib() -> Self? {
        Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)?.first as? Self
    }
}
