//
//  NoticiasCodable.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

// MARK: - NoticiasCodable
struct NoticiaCodable: Codable {
    
    let pagination: PaginationCodable?
    let data: [NoticiaElementCodable]
    
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case data = "data"
    }
}

// MARK: - NoticiaElementCodable
struct NoticiaElementCodable: Codable {
    
    let author, content, descricao: String?
    let imageURL: String?
    let publishedAt, title: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case descricao = "description"
        case imageURL = "image_url"
        case publishedAt = "published_at"
        case title = "title"
        case url = "url"
    }
}

// MARK: - PaginationCodable
struct PaginationCodable: Codable {
    let currentPage, perPage, totalItems, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case perPage = "per_page"
        case totalItems = "total_items"
        case totalPages = "total_pages"
    }
}
