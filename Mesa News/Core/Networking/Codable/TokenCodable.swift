//
//  TokenCodable.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

// MARK: - TokenCodable
struct TokenCodable: Codable {
    
    var token: String?
    var errors: [ErrorCodable]?
    
    enum CodingKeys: String, CodingKey {
        case token, errors
    }
}
