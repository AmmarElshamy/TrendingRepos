//
//  RepositoryTableViewCell.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit
import SkeletonView

final class RepositoryTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageBulletView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var starsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCircularViews()
    }
    
}

// MARK: - Setup
private extension RepositoryTableViewCell {
    func setupViews() {
        setupColors()
    }
    
    func setupColors() {
        ownerNameLabel.textColor = .gray
        titleLabel.textColor = .black
        descriptionLabel.textColor = .gray
        languageBulletView.backgroundColor = .blue
        languageLabel.textColor = .gray
        starsCountLabel.textColor = .gray
    }
    
    func setupCircularViews() {
        avatarImageView.isCircular = true
        languageBulletView.isCircular = true
        
        ownerNameLabel.skeletonCornerRadius = Float(ownerNameLabel.frame.height / 2)
        titleLabel.skeletonCornerRadius = Float(titleLabel.frame.height / 2)
    }
}

// MARK: - Binding
extension RepositoryTableViewCell {
    func bind(_ viewModel: ViewModelState<ViewModel>) {
        switch viewModel {
        case let .data(model):
            hideSkeleton()
            configureViews(with: model)
        case .skeleton:
            showAnimatedSkeleton()
        }
    }
    
    private func configureViews(with model: ViewModel) {
        avatarImageView.loadImage(with: model.avatarURL)
        ownerNameLabel.text = model.ownerName
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        languageLabel.text = model.language
        starsCountLabel.text = model.starsCount
        detailsStackView.isHidden = !model.isExpanded
    }
}
