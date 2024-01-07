//
//  ArticleImageCollectionViewCell.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

final class ArticleImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: ViewModel) {
        imageView.setImage(for: viewModel.imageUrl)
    }
}

extension ArticleImageCollectionViewCell {
    struct ViewModel {
        var imageUrl: String?
    }
}
