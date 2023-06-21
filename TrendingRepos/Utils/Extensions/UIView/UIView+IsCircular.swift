//
//  UIView+IsCircular.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

extension UIView {
    var isCircular: Bool {
        get {
            layer.cornerRadius == frame.height / 2
        }
        set {
            if newValue {
                layer.cornerRadius = frame.height / 2
                clipsToBounds = true
            }
        }
    }
}
