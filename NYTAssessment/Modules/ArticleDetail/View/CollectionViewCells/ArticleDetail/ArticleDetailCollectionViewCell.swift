//
//  ArticleDetailCollectionViewCell.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

final class ArticleDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bylineLabel: UILabel!
    @IBOutlet private weak var datePublishedLabel: UILabel!
    @IBOutlet private weak var abstractLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configureCell(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        bylineLabel.text = viewModel.byline
        datePublishedLabel.text = viewModel.datePublished
        abstractLabel.text = viewModel.abstract
    }
    
    private func setupUI() {
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        
        bylineLabel.textColor = .systemGray
        bylineLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        datePublishedLabel.textColor = .systemGray
        datePublishedLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        abstractLabel.textColor = .darkGray
        abstractLabel.font = .systemFont(ofSize: 18, weight: .light)
    }
}

extension ArticleDetailCollectionViewCell {
    struct ViewModel {
        var title: String?
        var byline: String?
        var datePublished: String?
        var abstract: String?
    }
}
