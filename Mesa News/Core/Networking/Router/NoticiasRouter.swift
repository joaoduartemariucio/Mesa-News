//
//  NoticiasRouter.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation
import Alamofire

enum NoticiasRouter: APIConfiguration {
    
    case buscarNoticias(currentPage: Int, perPage: Int)
    case buscarNoticiasDestaque

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .buscarNoticias(let currentPage, let perPage):
            return .url(
                [
                    Constants.API.ParametersKeys.currentPage: currentPage,
                    Constants.API.ParametersKeys.perPage: perPage
                ]
            )
        case .buscarNoticiasDestaque:
            return .url([:])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .buscarNoticias:
            return "/client/news"
        case .buscarNoticiasDestaque:
            return "/client/news/highlights"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.API.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Authentication
        if let session = UserSessionHelper.instance.recurperarAutenticacaoUsuario() {
            let authentication = "\(AuthenticationType.bearer.rawValue) \(session.token)"
            urlRequest.setValue(authentication, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        }
        
        // Parameters
        switch parameters {
        
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        
        return urlRequest
    }
}
