//
//  UserRouter.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation
import Alamofire

enum UserRouter: APIConfiguration {
    
    case cadastro(user: CadastroModel)
    case login(_ login: LoginModel)

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .cadastro(let user):
            return .body(
                [
                    Constants.API.ParametersKeys.name: user.nome,
                    Constants.API.ParametersKeys.email: user.email,
                    Constants.API.ParametersKeys.password: user.senha,
                ]
            )
        case .login(let login):
            return .body(
                [
                    Constants.API.ParametersKeys.email: login.email,
                    Constants.API.ParametersKeys.password: login.senha
                ]
            )
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .cadastro:
            return "/client/auth/signup"
        case .login:
            return "/client/auth/signin"
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
