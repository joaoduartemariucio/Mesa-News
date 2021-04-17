//
//  LoginCoordinator.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

class LoginCoordinator: Coordinator {
  
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        login()
    }
    
    func login(){
        
    }
}
