//
//  LoginViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

enum LoginStatus {
    case logadoSucesso, mostrarMensagensErro, resetarErrosFormulario,`default`
}

protocol LoginViewModelInput {
    
    var txtEmailObserver: BehaviorSubject<String> { get set }
    var txtSenhaObserver: BehaviorSubject<String> { get set }
    
    func logarUsuario()
}

protocol LoginViewModelOutput {
    
    var feedback: BehaviorRelay<LoginStatus> { get set }
    var errosLogin: [ErrorModel<LoginErrorType>] { get }
}

class LoginViewModel: BaseViewModel, LoginViewModelInput, LoginViewModelOutput {
    
    //    MARK: BaseViewModel e functions
    var disposable: DisposeBag = DisposeBag()
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var model: LoginModel = LoginModel()
    
    func viewDidLoad() {
        configurarObservers()
    }
    
    func configurarObservers(){
        
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
    }
    
    //    MARK: LoginViewModel Inputs
    var txtEmailObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    var txtSenhaObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    
    func logarUsuario() {
        
        feedback.accept(.resetarErrosFormulario)
        
        if !model.isDadosLoginValidos {
            feedback.accept(.mostrarMensagensErro)
            return
        }
    }
    
    //    MARK: LoginViewModel Outputs
    var feedback: BehaviorRelay<LoginStatus> = BehaviorRelay<LoginStatus>(value: .default)
    
    var errosLogin: [ErrorModel<LoginErrorType>] {
        get {
            return model.errors
        }
    }
}
