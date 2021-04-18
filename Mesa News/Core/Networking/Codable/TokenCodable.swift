//
//  TokenCodable.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

// MARK: - TokenCodable
struct TokenCodable: Codable {
    
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}
