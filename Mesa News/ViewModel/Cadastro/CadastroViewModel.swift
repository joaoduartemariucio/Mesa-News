//
//  CadastroViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

enum CadastroStatus {
    case cadastradoSucesso, mostrarMensagensErro, mostrarMensagensErroAPI, resetarErrosFormulario,`default`
}

protocol CadastroViewModelInput {
    
    var txtNomeObserver: BehaviorSubject<String> { get set }
    var txtEmailObserver: BehaviorSubject<String> { get set }
    var txtSenhaObserver: BehaviorSubject<String> { get set }
    var txtConfirmarSenhaObserver: BehaviorSubject<String> { get set }
    
    func cadastrarUsuario()
}

protocol CadastroViewModelOutput {
    
    var feedback: BehaviorRelay<CadastroStatus> { get set }
    var errosCadastro: [ErrorModel<CadastroErrorType>] { get }
    var errosCadastroAPI: [ErrorCodable] { get set }
}

class CadastroViewModel: BaseViewModel, CadastroViewModelOutput, CadastroViewModelInput {
    
    //    MARK: CadastroViewModel Outputs
    var feedback: BehaviorRelay<CadastroStatus> = BehaviorRelay<CadastroStatus>(value: .default)
    
    var errosCadastro: [ErrorModel<CadastroErrorType>] {
        get {
            return model.errors
        }
    }
    
    var errosCadastroAPI: [ErrorCodable] = [ErrorCodable]()
    
    //    MARK: BaseViewModel e functions
    var disposable: DisposeBag = DisposeBag()
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var model: CadastroModel = CadastroModel()
    
    func viewDidLoad() {
        configurarObservers()
    }
    
    func configurarObservers(){
        
        txtNomeObserver.asObserver()
            .subscribe(
                onNext: { value in
                    self.model.setNome(value)
                }
            ).disposed(by: disposable)
        
        txtEmailObserver.asObserver()
            .subscribe(
                onNext: { value in
                    self.model.setEmail(value)
                }
            ).disposed(by: disposable)
        
        txtSenhaObserver.asObserver()
            .subscribe(
                onNext: { value in
                    self.model.setSenha(value)
                }
            ).disposed(by: disposable)
        
        txtConfirmarSenhaObserver.asObserver()
            .subscribe(
                onNext: { value in
                    self.model.setConfirmarSenha(value)
                }
            ).disposed(by: disposable)
    }
    
    //    MARK: CadastroViewModel Inputs
    var txtNomeObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    var txtEmailObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    var txtSenhaObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    var txtConfirmarSenhaObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    
    func cadastrarUsuario() {
        isLoading.accept(true)
        
        feedback.accept(.resetarErrosFormulario)
        
        if !model.isDadosCadastroValidos {
            feedback.accept(.mostrarMensagensErro)
            isLoading.accept(false)
            return
        }
        
        UserClient.cadastro(user: model).asObservable().subscribe(
            onNext: { result in
                self.isLoading.accept(false)
                
                if let error = result.errors {
                    self.errosCadastroAPI = error
                    self.feedback.accept(.mostrarMensagensErroAPI)
                    return
                }
                
                if let token = result.token {
                    let userSession = UserSession(token: token)
                    UserSessionHelper.instance.salvarAutenticacaoUsuario(userSession)
                    self.feedback.accept(.cadastradoSucesso)
                }
            },
            onError: { error in
                self.isLoading.accept(false)
                let messageError = APIErrorMessageHelper.instance.retornaMensagemErroAPI(erro: error)
                self.mostrarMensagem.accept(messageError)
            }
        ).disposed(by: disposable)
        
    }
}
