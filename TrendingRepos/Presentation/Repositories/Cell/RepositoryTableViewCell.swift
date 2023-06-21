//
//  RepositoryTableViewCell.swift
//  TrendingRepos
//
//  Created by Ammar Elshamy on 21/06/2023.
//

import UIKit

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
    }
}

// MARK: - Binding
extension RepositoryTableViewCell {
    func bind(_ viewModel: ViewModel) {
        avatarImageView.loadImage(with: viewModel.avatarURL)
        ownerNameLabel.text = viewModel.ownerName
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        languageLabel.text = viewModel.language
        starsCountLabel.text = viewModel.starsCount
        detailsStackView.isHidden = !viewModel.isExpanded
    }
}
