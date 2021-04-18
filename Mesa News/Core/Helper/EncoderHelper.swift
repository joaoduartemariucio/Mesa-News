//
//  EncoderHelper.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class EncoderHelper {
    
    static let instance = EncoderHelper()
    
    func encode<T: Codable>(to value: T) -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            return encoded
        }
        return nil
    }
}
