//
//  UIImageView+LoadImage.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(with urlString: String?, placeholder: UIImage? = nil) {
        guard let urlString else { return }
        let url = URL(string: urlString)
        kf.setImage(with: url, placeholder: placeholder)
    }
}
