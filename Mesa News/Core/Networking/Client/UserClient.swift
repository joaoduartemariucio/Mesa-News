//
//  UserClient.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class UserClient: APIClient {
    
    static func cadastro(user: CadastroModel) -> Observable<TokenCodable> {
        return request(UserRouter.cadastro(user: user))
    }
    
    static func login(login: LoginModel) -> Observable<TokenCodable> {
        return request(UserRouter.login(login))
    }
}
