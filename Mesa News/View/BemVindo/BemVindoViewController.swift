//
//  BemVindoViewController.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class BemVindoViewController: UIViewController, BaseViewController {
    
    typealias View = BemVindoView
    typealias ViewModel = BemVindoViewModel
    typealias Navigation = BemVindoCoordinator
    
    weak var coordinator: BemVindoCoordinator?
    var disposable: DisposeBag = DisposeBag()
    
    var viewModel: BemVindoViewModel = BemVindoViewModel()
    var presentationView: BemVindoView = BemVindoView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        
        presentationView.btnCadastreSe.rx.tap.bind { self.coordinator?.parentCoordinator?.cadastro() }.disposed(by: disposable)
        presentationView.btnEntrar.rx.tap.bind {  self.coordinator?.parentCoordinator?.login() }.disposed(by: disposable)
    }
}
