//
//  MockNYTNetworkingService.swift
//  NYTAssessmentTests
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine
import NetworkingLayer

class MockNetworkingService: HomeServiceable {
    
    private let networkRequest: Requestable
    
    init(networkRequest: Requestable) {
        self.networkRequest = networkRequest
    }
    
    func getMostPopularArticlesService(request: MostPopularArticleRequest) -> AnyPublisher<MostPopularArticleResponse, NetworkError> {
        
        let mostPopularArticles = self.loadJson(fileName: "NYTResponse")
        
        return Just(mostPopularArticles!)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
    func loadJson(fileName: String) -> MostPopularArticleResponse? {
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let orderRating = try? decoder.decode(MostPopularArticleResponse.self, from: data)
        else {
            return nil
        }
        return orderRating
    }
}
