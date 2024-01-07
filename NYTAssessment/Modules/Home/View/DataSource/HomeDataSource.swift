//
//  HomeDataSource.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit
import Combine

final class HomeDataSource: NSObject {
    private let viewModel: HomeViewModel
    private var stateSubject = PassthroughSubject<State, Never>()
    var statePublisher: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    init(viewModel: HomeViewModel) {
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
            section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0)
            
            return section
        }
    }
}

extension HomeDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mostPopularArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MostPopularArticleCollectionViewCell.self), for: indexPath) as? MostPopularArticleCollectionViewCell else { return UICollectionViewCell() }
        let article = viewModel.mostPopularArticles[indexPath.row]
        let imageUrl = article.media?.first?.mediaMetaData?.first?.url
        let viewModel = MostPopularArticleCollectionViewCell.ViewModel(imageUrl: imageUrl, title: article.title, byLine: article.byline, publishedDate: article.publishedDate)
        cell.configureCell(with: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.mostPopularArticles[indexPath.row]
        stateSubject.send(.cellDidTap(article: article))
    }
}

extension HomeDataSource {
    enum State {
        case cellDidTap(article: MostPopularArticle)
    }
}
