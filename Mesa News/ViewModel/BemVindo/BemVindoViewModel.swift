//
//  BemVindoViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class BemVindoViewModel: BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()
    
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
}
