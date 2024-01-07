//
//  ArticleDetailConfigurator.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation

struct ArticleDetailDependency {
    var mostPopularArticle: MostPopularArticle
    
    init(mostPopularArticle: MostPopularArticle) {
        self.mostPopularArticle = mostPopularArticle
    }
}

enum ArticleDetailConfigurator {
    static func configureArticleDetailViewController(with dependency: ArticleDetailDependency) -> ArticleDetailViewController {
        let viewModel = ArticleDetailViewModel(mostPopularArticle: dependency.mostPopularArticle)
        let articleDetailViewController = ArticleDetailViewController.create()
        articleDetailViewController.viewModel = viewModel
        
        return articleDetailViewController
    }
}
