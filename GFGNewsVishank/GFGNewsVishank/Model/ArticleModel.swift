//
//  ArticleModel.swift
//  GFGVishank

import Foundation

//MARK: API Response
struct ArticleAPIResponse: Codable {
    let status: String?
    let feed: Feed?
    let items: [Item]?
}

// MARK: - Feed
struct Feed: Codable {
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}

// MARK: - Item
struct Item: Identifiable, Codable {
    let id = UUID()
    let title, pubDate: String?
    let thumbnail: String?
    let enclosure: Enclosure?
    
    enum CodingKeys: String, CodingKey {
        case title, pubDate, thumbnail
        case enclosure
    }
}

// MARK: - Enclosure
struct Enclosure: Codable {
    let link: String?
}
