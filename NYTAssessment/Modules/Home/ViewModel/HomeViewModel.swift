//
//  HomeViewModel.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine

final class HomeViewModel {
    private var cancellables = Set<AnyCancellable>()
    private let mostPopularArticlesUseCase: MostPopularArticlesUseCaseProtocol
    private var stateSubject = PassthroughSubject<State, Never>()
    var statePublisher: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    var articleSection: ArticleSection?
    var articlePeriod: ArticlePeriod?
    var mostPopularArticles = [MostPopularArticle]()
    
    init(mostPopularArticlesUseCase: MostPopularArticlesUseCaseProtocol) {
        self.mostPopularArticlesUseCase = mostPopularArticlesUseCase
    }
    
    func fetchMostPopularArticles() {
        bindMostPopularArticlesUseCase()
        mostPopularArticlesUseCase.getMostPopularArticles(section: articleSection, period: articlePeriod)
    }
    
    private func bindMostPopularArticlesUseCase() {
        mostPopularArticlesUseCase.statePublisher.sink { [weak self] states in
            guard let self else { return }
            
            switch states {
            case .showError(let message):
                self.stateSubject.send(.showError(message: message))
            case .showLoader:
                self.stateSubject.send(.showLoader)
            case .hideLoader:
                self.stateSubject.send(.hideLoader)
            case .success(let response):
                self.mostPopularArticles = response.results ?? []
                self.stateSubject.send(.articlesFetched)
            }
        }.store(in: &cancellables)
    }
}

extension HomeViewModel {
    enum State {
        case showLoader
        case hideLoader
        case showError(message: String)
        case articlesFetched
    }
}
