//
//  ErrorView.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit
import Lottie

class ErrorView: UIView {
    @IBOutlet private weak var animationView: LottieAnimationView!
    @IBOutlet weak var retryButton: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadCustomViewNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadCustomViewNib()
        setupViews()
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
}

// MARK: - Setup
private extension ErrorView {
    func setupViews() {
        setupAnimationView()
        setupRetryButton()
    }
    
    func setupAnimationView() {
        let animation = LottieAnimation.named("ErrorLottieAnimation")
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func setupRetryButton() {
        retryButton.setTitle("Retry", for: .normal)
        retryButton.setTitleColor(.systemGreen, for: .normal)
        retryButton.layer.borderWidth = 1
        retryButton.layer.borderColor = UIColor.systemGreen.cgColor
        retryButton.layer.cornerRadius = 8
    }
}
