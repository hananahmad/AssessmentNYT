//
//  MostPopularArticleResponse.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine

struct MostPopularArticleResponse: Codable {
    var status: String?
    var copyright: String?
    var numberOfResults: Int?
    var results: [MostPopularArticle]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numberOfResults = "num_results"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.numberOfResults = try container.decodeIfPresent(Int.self, forKey: .numberOfResults)
        self.results = try container.decodeIfPresent([MostPopularArticle].self, forKey: .results)
    }
}
