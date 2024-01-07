//
//  HomeRepository.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine
import NetworkingLayer

protocol HomeServiceable {
    func getMostPopularArticlesService(request: MostPopularArticleRequest) -> AnyPublisher<MostPopularArticleResponse, NetworkError>
}

final class HomeRepository: HomeServiceable {
    private let networkRequest: Requestable
    
    init(networkRequest: Requestable) {
        self.networkRequest = networkRequest
    }
    
    func getMostPopularArticlesService(request: MostPopularArticleRequest) -> AnyPublisher<MostPopularArticleResponse, NetworkError> {
        let endPoint = HomeRequestBuilder.getMostPopularArticles(request: request)
        let request = endPoint.createRequest()
        
        return networkRequest.request(request)
    }
}
