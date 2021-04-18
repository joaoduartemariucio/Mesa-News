//
//  CadastroModelTests.swift
//  Mesa NewsTests
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import XCTest
@testable import Mesa_News

class CadastroModelTests: XCTestCase {
    
//    MARK: Mocks da model
    
    var cadastroSemPreenchimento = CadastroModel()
    
    var cadastroTestePreenchimento = CadastroModel()
    
    var cadastroDadosCorretos = CadastroModel(
        nome: "João Vitor",
        email: "joaovitorduartemariucio@gmail.com",
        senha: "Senha!Forte1;",
        confirmarSenha: "Senha!Forte1;"
    )
    
    var cadastroEmailInvalido = CadastroModel(
        nome: "João Vitor",
        email: "email_invalido",
        senha: "Senha!Forte1;",
        confirmarSenha: "Senha!Forte1;"
    )
    
    var cadastroSenhaCurta = CadastroModel(
        nome: "João Vitor",
        email: "joaovitorduartemariucio@gmail.com",
        senha: "curta",
        confirmarSenha: "curta"
    )
    
    var cadastroSenhaFraca = CadastroModel(
        nome: "João Vitor",
        email: "joaovitorduartemariucio@gmail.com",
        senha: "12345678",
        confirmarSenha: "12345678"
    )
    
    var cadastroSenhaDiferente = CadastroModel(
        nome: "João Vitor",
        email: "joaovitorduartemariucio@gmail.com",
        senha: "senhadiferente1",
        confirmarSenha: "senhadiferente2"
    )
    
    //    MARK: Testes unitários da model

    /// Teste atribuição de valores na model
    func testAtribuicaoValoresNaModel(){
        cadastroTestePreenchimento.setNome("Joao")
        cadastroTestePreenchimento.setEmail("jvdmteste@gmail.com")
        cadastroTestePreenchimento.setSenha("789852")
        cadastroTestePreenchimento.setConfirmarSenha("9871ndlas")
        
        XCTAssertEqual(cadastroTestePreenchimento.nome, "Joao")
        XCTAssertEqual(cadastroTestePreenchimento.email, "jvdmteste@gmail.com")
        XCTAssertEqual(cadastroTestePreenchimento.senha, "789852")
        XCTAssertEqual(cadastroTestePreenchimento.confirmarSenha, "9871ndlas")
    }

    /// Teste cadastro sem dados preenchidos
    func testModelSemDados(){
        XCTAssertTrue(cadastroSemPreenchimento.nome.isEmpty)
        XCTAssertTrue(cadastroSemPreenchimento.email.isEmpty)
        XCTAssertTrue(cadastroSemPreenchimento.senha.isEmpty)
        XCTAssertTrue(cadastroSemPreenchimento.confirmarSenha.isEmpty)
    }
    
    /// Teste cadastro com dados preenchidos
    func testModelComDados(){
        XCTAssertTrue(!cadastroDadosCorretos.nome.isEmpty)
        XCTAssertTrue(!cadastroDadosCorretos.email.isEmpty)
        XCTAssertTrue(!cadastroDadosCorretos.senha.isEmpty)
        XCTAssertTrue(!cadastroDadosCorretos.confirmarSenha.isEmpty)
    }
    
    /// Teste cadastro com erros de preenchimento
    func testModelComErroPreenchimento(){
        cadastroSenhaDiferente.checarCamposCadastro()
        cadastroEmailInvalido.checarCamposCadastro()
        cadastroSenhaCurta.checarCamposCadastro()
        cadastroSemPreenchimento.checarCamposCadastro()
        
        XCTAssertFalse(cadastroSenhaDiferente.isDadosCadastroValidos)
        XCTAssertFalse(cadastroEmailInvalido.isDadosCadastroValidos)
        XCTAssertFalse(cadastroSenhaCurta.isDadosCadastroValidos)
        XCTAssertFalse(cadastroSemPreenchimento.isDadosCadastroValidos)
    }
    
    /// Teste cadastro sem erros de preenchimento
    func testModelSemErroPreenchimento(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertTrue(cadastroDadosCorretos.isDadosCadastroValidos)
    }
    
    /// Teste nome vazio
    func testModelComNomeVazio(){
        cadastroSemPreenchimento.checarCamposCadastro()
        XCTAssertTrue(cadastroSemPreenchimento.errors.contains(where: { $0.typeError == .nomeVazio }))
    }
    
    /// Teste nome não é vazio
    func testModelSemNomeVazio(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .nomeVazio }))
    }
    
    /// Teste e-mail vazio
    func testModelComEmailVazio(){
        cadastroSemPreenchimento.checarCamposCadastro()
        XCTAssertTrue(cadastroSemPreenchimento.errors.contains(where: { $0.typeError == .emailVazio }))
    }
    
    /// Teste  e-mail não é vazio
    func testModelSemEmailVazio(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .emailVazio }))
    }

    /// Teste e-mail com erro
    func testModelEmailComErroPreenchimento(){
        cadastroEmailInvalido.checarCamposCadastro()
        XCTAssertTrue(cadastroEmailInvalido.errors.contains(where: { $0.typeError == .emailInvalido }))
    }
    
    /// Teste e-mail sem erro
    func testModelEmailSemErroPreenchimento(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .emailInvalido }))
    }
    
    /// Teste senha vazia
    func testModelComSenhaVazia(){
        cadastroSemPreenchimento.checarCamposCadastro()
        XCTAssertTrue(cadastroSemPreenchimento.errors.contains(where: { $0.typeError == .senhaVazia }))
    }
    
    /// Teste  senha não é vazia
    func testModelSemSenhaVazia(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .senhaVazia }))
    }

    /// Teste e-mail com erro: senha curta
    func testModelComErroSenhaCurta(){
        cadastroSenhaCurta.checarCamposCadastro()
        XCTAssertTrue(cadastroSenhaCurta.errors.contains(where: { $0.typeError == .senhaCurta }))
    }
    
    /// Teste e-mail sem erro: senha curta
    func testModelSemErroSenhaCurta(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .senhaCurta }))
    }
    
    /// Teste e-mail com erro: senha fraca
    func testModelComErroSenhaFraca(){
        cadastroSenhaFraca.checarCamposCadastro()
        XCTAssertTrue(cadastroSenhaFraca.errors.contains(where: { $0.typeError == .senhaFraca }))
    }
    
    /// Teste e-mail sem erro: senha fraca
    func testModelSemErroSenhaFraca(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .senhaFraca }))
    }
    
    /// Teste e-mail com erro: senha divergentes
    func testModelComErroSenhaDivergentes(){
        cadastroSenhaDiferente.checarCamposCadastro()
        XCTAssertTrue(cadastroSenhaDiferente.errors.contains(where: { $0.typeError == .senhasDivergentes }))
    }
    
    /// Teste e-mail sem erro: senha divergentes
    func testModelSemErroSenhaDivergentes(){
        cadastroDadosCorretos.checarCamposCadastro()
        XCTAssertFalse(cadastroDadosCorretos.errors.contains(where: { $0.typeError == .senhasDivergentes }))
    }
}
