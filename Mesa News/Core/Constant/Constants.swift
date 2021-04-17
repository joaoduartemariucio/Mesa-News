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
            static let baseURL = "https://mesa-news-api.herokuapp.com"
        }
        
        struct ParametersKeys {
            static let name = "name"
            static let email = "email"
            static let password = "password"
        }
    }
    
    struct App {
        
        static let name = "Mesa News"
        
        struct Keys {
            static let user_token = "user_token"
        }
        
        struct Image {
            
        }
    }
}
