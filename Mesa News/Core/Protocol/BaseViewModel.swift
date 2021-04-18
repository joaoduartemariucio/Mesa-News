//
//  BaseViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

protocol BaseViewModel {
    
    var disposable: DisposeBag  { get set }
    var mostrarMensagem: BehaviorRelay<String>  { get set }
    var isLoading: BehaviorRelay<Bool>  { get set }

    func viewDidLoad()
}

extension BaseViewModel {
    
    func viewDidLoad(){ }
}

