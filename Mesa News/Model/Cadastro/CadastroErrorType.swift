//
//  CadastroErrorType.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

enum CadastroErrorType: TypeErrorModel {
    case nomeVazio
    case emailVazio, emailInvalido
    case senhaVazia, senhaCurta, senhaFraca
    case confirmarSenhaVazia
    case senhasDivergentes
}
