//
//  HomeCoordinator.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class HomeCoordinator: Coordinator {
  
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        home()
    }
    
    func home() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func abrirNoticia(url: String){
        let vc = NoticiaWebViewController()
        vc.coordinator = self
        vc.urlNoticia = url
        navigationController.pushViewController(vc, animated: true)
    }
}
