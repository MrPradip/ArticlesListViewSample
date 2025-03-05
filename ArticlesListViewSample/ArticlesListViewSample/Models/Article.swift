//
//  Article.swift
//  ArticlesListViewSample
//
//  Created by Pradip Kumar on 04/03/25.
//

import Foundation

// MARK: - Model
struct ArticleResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults) ?? 0
        articles = try container.decodeIfPresent([Article].self, forKey: .articles) ?? []
    }
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decodeIfPresent(Source.self, forKey: .source)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try container.decodeIfPresent(String.self, forKey: .content)
    }
}

struct Source: Codable {
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
