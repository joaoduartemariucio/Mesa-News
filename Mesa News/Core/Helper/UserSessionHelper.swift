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
    
    func salvarAutenticacaoUsuario(_ session: UserSession){
        PreferencesHelper.instance.saveCodable(
            key: Constants.App.Keys.user_token,
            value: session
        )
    }
    
    func recurperarAutenticacaoUsuario() -> UserSession? {
        return PreferencesHelper.instance.getCodable(key: Constants.App.Keys.user_token)
    }
    
    func clearSession(){
        PreferencesHelper.instance.removeValue(key: Constants.App.Keys.user_token)
    }
    
    var isUserLogged: Bool {
        get {
            return recurperarAutenticacaoUsuario() != nil
        }
    }
}
