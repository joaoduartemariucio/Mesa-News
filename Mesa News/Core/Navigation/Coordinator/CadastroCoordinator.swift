//
//  CadastroCoordinator.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

class CadastroCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        cadastreSe()
    }
    
    func cadastreSe(){
        let vc = CadastroViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
