//
//  ErrorCodable.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

// MARK: - ErrorCodable
struct ErrorCodable: Codable {
    let code, field, message: String
}

