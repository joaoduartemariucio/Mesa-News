//
//  HomeModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class HomeModel {

    var currentPage, perPage, totalPages, totalItems: Int
    var data: [NoticiaElementCodable]
    
    var nextPage: Int {
        get {
            return currentPage + 1
        }
    }
    
    init(currentPage: Int, perPage: Int, totalPages: Int, totalItems: Int, data: [NoticiaElementCodable]) {
        self.currentPage = currentPage
        self.perPage = perPage
        self.totalPages = totalPages
        self.totalItems = totalItems
        self.data = data
    }
    
    init(){
        self.currentPage = 1
        self.perPage = 20
        self.totalPages = 0
        self.totalItems = 0
        self.data = [NoticiaElementCodable]()
    }
    
    func setPagination(_ pagination: PaginationCodable){
        print("\(type(of: self)) setPagination: currentPage = \(pagination.currentPage)")
        self.currentPage = pagination.currentPage
        self.perPage = pagination.perPage
        self.totalItems = pagination.totalItems
        self.totalPages = pagination.totalPages
    }
    
    func checarSeExisteProximaPagina() -> Bool {
        let current = currentPage
        let newCurrent = current + 1
        
        if newCurrent <= totalPages {
            return true
        }else {
            return false
        }
    }
    
    func adicionarMaisNoticias(_ noticias: [NoticiaElementCodable]) {
        self.data.append(contentsOf: noticias)
    }
}
