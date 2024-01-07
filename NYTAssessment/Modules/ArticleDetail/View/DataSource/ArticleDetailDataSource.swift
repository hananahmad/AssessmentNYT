//
//  ArticleDetailDataSource.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

final class ArticleDetailDataSource: NSObject {
    enum Section {
        case image
        case detail
        
        var value: Int {
            switch self {
            case .image:
                return 0
            case .detail:
                return 1
            }
        }
    }
    
    private let viewModel: ArticleDetailViewModel
    private var sections = [Section.image, Section.detail]
    
    init(viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
    }
    
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, layoutEnvironment in
            let layoutSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(200.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: layoutSize)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16.0
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
            
            return section
        }
    }
    
    private func getSection(forIndex: Int) -> Section {
        return sections[forIndex]
    }
}

extension ArticleDetailDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch getSection(forIndex: section) {
        case .image:
            return 1
        case .detail:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch getSection(forIndex: indexPath.section) {
        case .image:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ArticleImageCollectionViewCell.self), for: indexPath) as? ArticleImageCollectionViewCell else { return UICollectionViewCell() }
            
            let article = viewModel.mostPopularArticle
            let imageUrl = article.media?.first?.mediaMetaData?.last?.url
            let viewModel = ArticleImageCollectionViewCell.ViewModel(imageUrl: imageUrl)
            cell.configureCell(with: viewModel)
            
            return cell
            
        case .detail:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ArticleDetailCollectionViewCell.self), for: indexPath) as? ArticleDetailCollectionViewCell else { return UICollectionViewCell() }
            
            let article = viewModel.mostPopularArticle
            let viewModel = ArticleDetailCollectionViewCell.ViewModel(title: article.title, byline: article.byline, datePublished: article.publishedDate, abstract: article.abstract)
            cell.configureCell(with: viewModel)
            
            return cell
        }
    }
}
