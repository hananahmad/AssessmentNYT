//
//  ArticleSection.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation

enum ArticleSection {
    case all
    
    var value: String {
        switch self {
        case .all:
            return "all-sections"
        }
    }
}
