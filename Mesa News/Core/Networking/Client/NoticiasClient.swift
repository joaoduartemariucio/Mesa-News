//
//  NoticiasClient.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class NoticiasClient: APIClient {
    
    static func buscarNoticias(currentPage: Int, perPage: Int) -> Observable<NoticiaCodable> {
        return request(NoticiasRouter.buscarNoticias(currentPage: currentPage, perPage: perPage))
    }
    
    static func buscarNoticiasDestaque() -> Observable<NoticiaCodable> {
        return request(NoticiasRouter.buscarNoticiasDestaque)
    }
}

