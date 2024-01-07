//
//  ArticlePeriod.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation

enum ArticlePeriod {
    case day
    case week
    case month
    
    var value: Int {
        switch self {
        case .day:
            return 1
        case .week:
            return 7
        case .month:
            return 30
        }
    }
}
