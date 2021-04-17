//
//  BaseViewController.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

protocol BaseViewController {
    
    associatedtype View: BaseView
    associatedtype ViewModel: BaseViewModel
    associatedtype Navigation: Coordinator
    
    var coordinator: Navigation? { get set }
    var disposable: DisposeBag { get set }
    
    var viewModel: ViewModel { get set }
    var presentationView: View { get set }
    
    func bindView()
}
