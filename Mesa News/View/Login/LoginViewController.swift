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
            
        }.disposed(by: disposable)
        
        viewModel.isLoading.bind { value in
            
        }.disposed(by: disposable)
        
        viewModel.feedback.bind { value in
            self.tratarStatus(value)
        }.disposed(by: disposable)
    }
    
    func tratarStatus(_ status: LoginStatus){
        switch status {
        case .logadoSucesso:
            
            break
        case .mostrarMensagensErro:
            presentationView.setMensagensErro(erros: viewModel.errosLogin)
            break
        case .resetarErrosFormulario:
            presentationView.resetarErrosFormulario()
            break
        default:
            break
        }
    }
}
