//
//  UserSessionHelper.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation
import Security

class UserSessionHelper {

    static let instance = UserSessionHelper()
    
    func salvarAutenticacaoUsuario(login: TokenCodable){
        PreferencesHelper.instance.saveCodable(
            key: Constants.App.Keys.user_token,
            value: login
        )
    }
    
    func recurperarAutenticacaoUsuario() -> TokenCodable? {
        return PreferencesHelper.instance.getCodable(key: Constants.App.Keys.user_token)
    }
}