//
//  MostPopularArticleRequest.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation

struct MostPopularArticleRequest {
    var section: ArticleSection?
    var period: ArticlePeriod?
    
    init(section: ArticleSection?, period: ArticlePeriod?) {
        self.section = section
        self.period = period
    }
}
