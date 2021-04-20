//
//  NoticiaModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 19/04/21.
//

import Foundation

class NoticiaModel {
    
    let author, content, descricao, title: String
    let imageURL: String
    let publishedAt: Date
    let url: String
    let favoritada: Bool = false
    let codableNoticia: NoticiaElementCodable
    
    init(codable: NoticiaElementCodable) {
        self.author = codable.author ?? ""
        self.content = codable.content ?? ""
        self.descricao = codable.descricao ?? ""
        self.imageURL = codable.imageURL ?? ""
        self.publishedAt = codable.publishedAt.dateFromISO8601
        self.title = codable.title
        self.url = codable.url ?? ""
        self.codableNoticia = codable
    }
    
    func checarSeFoiFavoritada() -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.codableNoticia) {
            let dataArray = PreferencesHelper.instance.getDataArray(key: Constants.App.Keys.noticias_favoritadas)
            if dataArray.contains(encoded) {
                return true
            }
        }
        return false
    }
}
