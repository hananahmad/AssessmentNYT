//
//  HomeConfigurator.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import NetworkingLayer

enum HomeConfigurator {
    static func configureHomeViewController() -> HomeViewController {
        let mostPopularArticleUseCase = MostPopularArticlesUseCase(repository: repository)
        let viewModel = HomeViewModel(mostPopularArticlesUseCase: mostPopularArticleUseCase)
        viewModel.articleSection = .all
        viewModel.articlePeriod = .week
        let homeViewController = HomeViewController.instantiate(withStoryboard: .home)
        homeViewController.viewModel = viewModel
        
        return homeViewController
    }
    
    static var repository: HomeServiceable {
        HomeRepository(networkRequest: NetworkingLayerRequestable(requestTimeOut: 60))
    }
}
