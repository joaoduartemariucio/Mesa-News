//
//  LoginModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

class LoginModel {
    
    private (set) var email: String
    private (set) var senha: String
    
    var isDadosLoginValidos: Bool {
        get {
            checarCamposLogin()
            return errors.count == 0
        }
    }
    
    private (set) var errors:[ErrorModel<LoginErrorType>] = [ErrorModel<LoginErrorType>]()
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    init() {
        self.email = ""
        self.senha = ""
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setSenha(_ senha: String) {
        self.senha = senha
    }
    
    func checarCamposLogin() {
        
        errors = [ErrorModel<LoginErrorType>]()
        
        if email.isEmpty {
            errors.append(ErrorModel<LoginErrorType>(typeError: .emailVazio, message: "email_vazio".translate))
        }
        
        if !email.isValidEmail {
            errors.append(ErrorModel<LoginErrorType>(typeError: .emailInvalido, message: "email_invalido".translate))
        }
        
        if senha.isEmpty {
            errors.append(ErrorModel<LoginErrorType>(typeError: .senhaVazia, message: "senha_vazia".translate))
        }
    }
    
    var description: String {
        return "<\(type(of: self)): email = \(email) senha = \(senha) errors = \(errors)>"
    }
}
