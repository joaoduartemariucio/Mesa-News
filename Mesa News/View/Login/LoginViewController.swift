//
//  LoginViewController.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

class LoginViewController: UIViewController, BaseViewController {
   
    typealias View = LoginView
    typealias ViewModel = LoginViewModel
    typealias Navigation = LoginCoordinator
    
    var coordinator: LoginCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: LoginViewModel = LoginViewModel()
    var presentationView: LoginView = LoginView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "tela_login".translate
        
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
        presentationView.btnConfirmar.rx.tap.bind {
            self.viewModel.logarUsuario()
        }.disposed(by: disposable)
        
        presentationView.txtEmail
                    .text
                    .bind(to: viewModel.txtEmailObserver)
                    .disposed(by: disposable)
        
        presentationView.txtSenha
                    .text
                    .bind(to: viewModel.txtSenhaObserver)
                    .disposed(by: disposable)
        
        viewModel.mostrarMensagem.bind { value in
            if !value.isEmpty {
                self.mostrarMensagem(value)
            }
        }.disposed(by: disposable)
        
        viewModel.isLoading.bind { value in
            if value {
                self.showLoading("por_favor_aguarde".translate)
            }else {
                self.hideLoading()
            }
        }.disposed(by: disposable)
        
        viewModel.feedback.bind { value in
            self.tratarStatus(value)
        }.disposed(by: disposable)
    }
    
    func tratarStatus(_ status: LoginStatus){
        switch status {
        case .logadoSucesso:
            irParaTelaHome()
            break
        case .mostrarMensagensErro:
            presentationView.setMensagensErro(erros: viewModel.errosLogin)
            break
        case .mostrarMensagensErroAPI:
            let errors = viewModel.errosLoginAPI
            if errors.contains(where: { $0.code == "INVALID_CREDENTIALS" }) {
                self.mostrarMensagem("erro_credenciais_invalidas".translate)
            }else {
                self.mostrarMensagem("erro_default_login".translate)
            }
            break
        case .resetarErrosFormulario:
            presentationView.resetarErrosFormulario()
            break
        default:
            break
        }
    }
    
    func irParaTelaHome(){
        self.coordinator?.parentCoordinator?.home()
        self.navigationController?.viewControllers.removeAll(where: { $0 == self  || $0 is BemVindoViewController})
        self.coordinator?.parentCoordinator?.childDidFinish(self.coordinator)
    }
}
