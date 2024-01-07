//
//  MostPopularArticle.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import Foundation
import Combine

struct MostPopularArticle: Codable {
    var uri: String?
    var url: String?
    var adxKeywords: String?
    var column: String?
    var section: String?
    var subSection: String?
    var nytdSection: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var publishedDate: String?
    var updated: String?
    var source: String?
    var id: Int?
    var assetId: Int?
    var views: Int?
    var desFacet: [String]?
    var orgFacet: [String]?
    var perFacet: [String]?
    var geoFacet: [String]?
    var media: [MostPopularArticleMedia]?
    var etaId: Int?
    
    enum CodingKeys: String, CodingKey {
        case uri
        case url
        case adxKeywords = "adx_keywords"
        case column
        case section
        case subSection = "subsection"
        case nytdSection = "nytdsection"
        case byline
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case updated
        case source
        case id
        case assetId = "asset_id"
        case views
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaId = "eta_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uri = try container.decodeIfPresent(String.self, forKey: .uri)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.adxKeywords = try container.decodeIfPresent(String.self, forKey: .adxKeywords)
        self.column = try container.decodeIfPresent(String.self, forKey: .column)
        self.section = try container.decodeIfPresent(String.self, forKey: .section)
        self.subSection = try container.decodeIfPresent(String.self, forKey: .subSection)
        self.nytdSection = try container.decodeIfPresent(String.self, forKey: .nytdSection)
        self.byline = try container.decodeIfPresent(String.self, forKey: .byline)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        self.updated = try container.decodeIfPresent(String.self, forKey: .updated)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.assetId = try container.decodeIfPresent(Int.self, forKey: .assetId)
        self.views = try container.decodeIfPresent(Int.self, forKey: .views)
        self.desFacet = try container.decodeIfPresent([String].self, forKey: .desFacet)
        self.orgFacet = try container.decodeIfPresent([String].self, forKey: .orgFacet)
        self.perFacet = try container.decodeIfPresent([String].self, forKey: .perFacet)
        self.geoFacet = try container.decodeIfPresent([String].self, forKey: .geoFacet)
        self.media = try container.decodeIfPresent([MostPopularArticleMedia].self, forKey: .media)
        self.etaId = try container.decodeIfPresent(Int.self, forKey: .etaId)
    }
}
