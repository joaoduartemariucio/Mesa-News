//
//  ErrorModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

struct ErrorModel<T: TypeErrorModel> {
    
    var typeError: T
    var message: String
    
    var description: String {
        return "<\(type(of: self)): type = \(typeError) message = \(message)>"
    }
}


protocol TypeErrorModel { }
