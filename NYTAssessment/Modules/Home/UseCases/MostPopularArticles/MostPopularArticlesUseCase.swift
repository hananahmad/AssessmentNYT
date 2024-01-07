//
//  MostPopularArticlesUseCase.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine

protocol MostPopularArticlesUseCaseProtocol {
    func getMostPopularArticles(section: ArticleSection?, period: ArticlePeriod?)
    var statePublisher: AnyPublisher<MostPopularArticlesUseCase.State, Never> { get }
}

final class MostPopularArticlesUseCase: MostPopularArticlesUseCaseProtocol {
    private let repository: HomeServiceable
    private var cancellables = Set<AnyCancellable>()
    private var stateSubject = PassthroughSubject<State, Never>()
    var statePublisher: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    init(repository: HomeServiceable) {
        self.repository = repository
    }
    
    func getMostPopularArticles(section: ArticleSection?, period: ArticlePeriod?) {
        stateSubject.send(.showLoader)
        
        let request = MostPopularArticleRequest(section: section, period: period)
        repository.getMostPopularArticlesService(request: request)
            .sink { [weak self] completion in
                self?.stateSubject.send(.hideLoader)
                
                switch completion {
                case .failure(let error):
                    self?.stateSubject.send(.showError(message: error.localizedDescription))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.stateSubject.send(.hideLoader)
                self?.stateSubject.send(.success(response: response))
            }
        .store(in: &cancellables)
    }
}

extension MostPopularArticlesUseCase {
    enum State {
        case showError(message: String)
        case showLoader
        case hideLoader
        case success(response: MostPopularArticleResponse)
    }
}
