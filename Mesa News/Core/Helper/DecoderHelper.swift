//
//  DecoderHelper.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class DecoderHelper {

    static let instance = DecoderHelper()

    func decode<T: Codable>(data: Data)-> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
