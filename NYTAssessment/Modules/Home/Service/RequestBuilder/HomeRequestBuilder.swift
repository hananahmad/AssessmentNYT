//
//  HomeRequestBuilder.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import NetworkingLayer

enum HomeRequestBuilder {
    case getMostPopularArticles(request: MostPopularArticleRequest)
    
    var requestTimeOut: Int {
        return 20
    }
    
    var httpMethod: SmilesHTTPMethod {
        switch self {
        case .getMostPopularArticles:
            return .GET
        }
    }
    
    func createRequest() -> NetworkRequest {
        var headers: [String: String] = [:]
        
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        
        return NetworkRequest(url: getUrl(from: Constants.baseUrl), httpMethod: httpMethod)
    }
    
    private func getUrl(from baseUrl: String) -> String {
        switch self {
        case .getMostPopularArticles(let request):
            return "\(baseUrl)mostviewed/\(request.section?.value ?? "")/\(request.period?.value ?? 7).json?api-key=\(Constants.apiKey)"
        }
    }
}
