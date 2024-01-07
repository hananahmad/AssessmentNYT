//
//  MostPopularArticleMedia.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine

struct MostPopularArticleMedia: Codable {
    var type: String?
    var subType: String?
    var caption: String?
    var copyright: String?
    var approvedForSyndication: Int?
    var mediaMetaData: [MostPopularArticleMediaMetaData]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case subType = "subtype"
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetaData = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.subType = try container.decodeIfPresent(String.self, forKey: .subType)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.approvedForSyndication = try container.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
        self.mediaMetaData = try container.decodeIfPresent([MostPopularArticleMediaMetaData].self, forKey: .mediaMetaData)
    }
}
