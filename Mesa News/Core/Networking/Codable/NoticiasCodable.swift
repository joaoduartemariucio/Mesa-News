//
//  NoticiasCodable.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

// MARK: - NoticiasCodable
struct NoticiasCodable: Codable {
    let pagination: PaginationCodable
    let data: [NoticiaCodable]
}

// MARK: - NoticiaCodable
struct NoticiaCodable: Codable {
    
    let title, descricaoNoticia, content, author: String
    let publishedAt: String
    let highlight: Bool
    let url, imageURL: String

    enum CodingKeys: String, CodingKey {
        case title
        case descricaoNoticia = "description"
        case content, author
        case publishedAt = "published_at"
        case highlight, url
        case imageURL = "image_url"
    }
}

// MARK: - PaginationCodable
struct PaginationCodable: Codable {
    
    let currentPage, perPage, totalPages, totalItems: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case perPage = "per_page"
        case totalPages = "total_pages"
        case totalItems = "total_items"
    }
}
