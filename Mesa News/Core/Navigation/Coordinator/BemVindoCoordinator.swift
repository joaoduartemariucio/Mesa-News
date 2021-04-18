//
//  BemVindoCoordinator.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

class BemVindoCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        bemVindo()
    }
    
    func bemVindo(){
        let vc = BemVindoViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
