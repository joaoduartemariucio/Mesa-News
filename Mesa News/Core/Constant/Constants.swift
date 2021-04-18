//
//  Constants.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

struct Constants {
    
    struct API {
        
        struct ProductionServer {
            static let baseURL = "https://mesa-news-api.herokuapp.com/v1"
        }
        
        struct ParametersKeys {
            static let name = "name"
            static let email = "email"
            static let password = "password"
            static let currentPage = "current_page"
            static let perPage = "per_page"
        }
    }
    
    struct App {
        
        static let name = "Mesa News"
        
        struct Keys {
            static let user_token = "user_token"
        }
        
        struct Image {
            static let logo_app = "logo_app"
            static let ic_arroba = "ic_arroba"
            static let ic_password_visivel = "ic_password_visivel"
            static let ic_password_invisivel = "ic_password_invisivel"
            static let ic_pessoa = "ic_pessoa"
            static let ic_senha = "ic_senha"
            static let ic_noticia_nao_favoritada = "ic_noticia_nao_favoritada"
            static let ic_noticia_favoritada = "ic_noticia_favoritada"
        }
    }
}
