//
//  APIConfiguration.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters : RequestParams { get }
}

enum HTTPHeaderField: String {
    
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
}

enum ContentType: String {
    
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    
    case body(_:Parameters)
    case url(_:Parameters)
}

enum APIError: Error {
    case noDecoded              //Status code 200 mas não decodificou
    case noContent              //Status code 204
    case badRequest             //Status code 400
    case unauthorized           //Status code 401
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case noAllowed              //Status code 405
    case conflict               //Status code 409
    case unprocessableEntity    //Status code 422
    case internalServerError    //Status code 500
    case notIdentified          //Status não tratado
}
