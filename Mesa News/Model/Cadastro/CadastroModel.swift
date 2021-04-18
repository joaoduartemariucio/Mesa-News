//
//  CadastroModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

class CadastroModel {
    
    private (set) var nome: String
    private (set) var email: String
    private (set) var senha: String
    private (set) var confirmarSenha: String
    
    var isDadosCadastroValidos: Bool {
        get {
            checarCamposCadastro()
            return errors.count == 0
        }
    }
    
    private (set) var errors:[ErrorModel<CadastroErrorType>] = [ErrorModel<CadastroErrorType>]()
    
    init(nome: String, email: String, senha: String, confirmarSenha: String) {
        self.nome = nome
        self.email = email
        self.senha = senha
        self.confirmarSenha = confirmarSenha
    }
    
    init() {
        self.nome = ""
        self.email = ""
        self.senha = ""
        self.confirmarSenha = ""
    }
    
    func setNome(_ nome: String) {
        self.nome = nome
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setSenha(_ senha: String) {
        self.senha = senha
    }
    
    func setConfirmarSenha(_ senha: String) {
        self.confirmarSenha = senha
    }
    
    func checarCamposCadastro() {
        
        errors = [ErrorModel<CadastroErrorType>]()
        
        if nome.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .nomeVazio, message: "nome_vazio".translate))
        }
        
        if email.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .emailVazio, message: "email_vazio".translate))
        }
        
        if !email.isValidEmail {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .emailInvalido, message: "email_invalido".translate))
        }
        
        if senha.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhaVazia, message: "senha_vazia".translate))
        }
        
        if senha.count < 8 {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhaCurta, message: "senha_curta".translate))
        }
        
        if !senha.isSenhaForte {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhaFraca, message: "senha_fraca".translate))
        }
        
        if confirmarSenha.isEmpty {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .confirmarSenhaVazia, message: "confirmar_senha_vazio".translate))
        }
        
        if confirmarSenha != senha {
            errors.append(ErrorModel<CadastroErrorType>(typeError: .senhasDivergentes, message: "senhas_divergentes".translate))
        }
    }
    
    var description: String {
        return "<\(type(of: self)): nome = \(nome) email = \(email) senha = \(senha) confirmarSenha = \(confirmarSenha) errors = \(errors)>"
    }
}
