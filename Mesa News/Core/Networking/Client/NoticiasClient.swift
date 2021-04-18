//
//  NoticiasClient.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class NoticiasClient: APIClient {
    
    static func buscarNoticias() -> Observable<NoticiasCodable> {
        return request(NoticiasRouter.buscarNoticias(currentPage: 1, perPage: 20))
    }
    
    static func buscarNoticiasDestaque() -> Observable<NoticiasCodable> {
        return request(NoticiasRouter.buscarNoticiasDestaque)
    }
}

