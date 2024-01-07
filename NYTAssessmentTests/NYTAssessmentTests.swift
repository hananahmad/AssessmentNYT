//
//  NYTAssessmentTests.swift
//  NYTAssessmentTests
//
//  Created by Hanan on 07/01/2024.
//

import XCTest
import Combine
import NetworkingLayer

@testable import NYTAssessment

final class NYTAssessmentTests: XCTestCase {
    
    var sut: HomeViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    func testLoadingPopularArticles() throws {
        //Arrange
        let networkRequestable = NetworkingLayerRequestable(requestTimeOut: 60)
        let mock = MockNetworkingService(networkRequest: networkRequestable)
        let request = MostPopularArticleRequest(section: .all, period: .week)
        
        //Expectation
        let promise = expectation(description: "Loading popular articles")
        
        //Result
        mock.getMostPopularArticlesService(request: request).sink { (completion) in
//            XCTFail()
        } receiveValue: { (response) in
            if let articles = response.results, !articles.isEmpty {
                promise.fulfill()
            }
            
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 60)
        
    }
    
}
