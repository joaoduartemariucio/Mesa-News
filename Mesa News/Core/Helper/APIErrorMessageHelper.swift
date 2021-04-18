//
//  APIErrorMessageHelper.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class APIErrorMessageHelper {
     
    static let instance = APIErrorMessageHelper()
    
    func retornaMensagemErroAPI(erro: Error) -> String {
        guard let erro = erro as? APIError else {
            return "erro_api_default".translate
        }
        switch erro {
        case .noDecoded:
            return "erro_noDecoded".translate
        case .noContent:
            return "erro_noContent".translate
        case .badRequest:
            return "erro_badRequest".translate
        case .unauthorized:
            return "erro_unauthorized".translate
        case .forbidden:
            return "erro_forbidden".translate
        case .notFound:
            return "erro_notFound".translate
        case .noAllowed:
            return "erro_noAllowed".translate
        case .conflict:
            return "erro_conflict".translate
        case .internalServerError:
            return "erro_internalServerError".translate
        case .unprocessableEntity:
            return "erro_unprocessableEntity".translate
        case .notIdentified:
            return "erro_api_default".translate
        }
    }
}
