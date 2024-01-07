//
//  MostPopularArticleCollectionViewCell.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

final class MostPopularArticleCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var containerStackView: UIStackView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var informationStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bylineLabel: UILabel!
    @IBOutlet private weak var publishedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func setupUI() {
        imageView.roundAllCorners()
        
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        bylineLabel.textColor = .systemGray
        bylineLabel.font = .systemFont(ofSize: 17, weight: .regular)
        
        publishedDateLabel.textColor = .systemGray
        publishedDateLabel.font = .systemFont(ofSize: 17, weight: .regular)
        
        informationStackView.setCustomSpacing(16.0, after: titleLabel)
        informationStackView.setCustomSpacing(8.0, after: bylineLabel)
    }
    
    func configureCell(with viewModel: ViewModel) {
        imageView.setImage(for: viewModel.imageUrl)
        titleLabel.text = viewModel.title
        bylineLabel.text = viewModel.byLine
        publishedDateLabel.text = viewModel.publishedDate
    }
}

extension MostPopularArticleCollectionViewCell {
    struct ViewModel {
        let imageUrl: String?
        let title: String?
        let byLine: String?
        let publishedDate: String?
    }
}
