//
//  CadastroViewController.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

class CadastroViewController: UIViewController, BaseViewController {
   
    typealias View = CadastroView
    typealias ViewModel = CadastroViewModel
    typealias Navigation = CadastroCoordinator
    
    var coordinator: CadastroCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: CadastroViewModel = CadastroViewModel()
    var presentationView: CadastroView = CadastroView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "tela_cadastro".translate
        
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
        presentationView.btnConfirmar.rx.tap.bind {
            self.viewModel.cadastrarUsuario()
        }.disposed(by: disposable)
        
        presentationView.txtNome
                    .text
                    .bind(to: viewModel.txtNomeObserver)
                    .disposed(by: disposable)
        
        presentationView.txtEmail
                    .text
                    .bind(to: viewModel.txtEmailObserver)
                    .disposed(by: disposable)
        
        presentationView.txtSenha
                    .text
                    .bind(to: viewModel.txtSenhaObserver)
                    .disposed(by: disposable)
        
        presentationView.txtConfirmarSenha
                    .text
                    .bind(to: viewModel.txtConfirmarSenhaObserver)
                    .disposed(by: disposable)

        viewModel.mostrarMensagem.bind { value in
            
        }.disposed(by: disposable)
        
        viewModel.isLoading.bind { value in
            
        }.disposed(by: disposable)
        
        viewModel.feedback.bind { value in
            self.tratarStatus(value)
        }.disposed(by: disposable)
    }
    
    func tratarStatus(_ status: CadastroStatus){
        switch status {
        case .cadastradoSucesso:
            self.mostrarMensagem("usuario_cadastrado_sucesso".translate) { _ in
                self.irParaTelaLogin()
            }
            break
        case .mostrarMensagensErro:
            presentationView.setMensagensErro(erros: viewModel.errosCadastro)
            break
        case .resetarErrosFormulario:
            presentationView.resetarErrosFormulario()
            break
        default:
            break
        }
    }
    
    func irParaTelaLogin(){
        self.coordinator?.parentCoordinator?.login()
        self.navigationController?.viewControllers.removeAll(where: { $0 == self })
        self.coordinator?.parentCoordinator?.childDidFinish(self.coordinator)
    }
}
