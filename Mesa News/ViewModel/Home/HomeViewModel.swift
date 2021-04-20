//
//  HomeViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation
import RxSwiftExt

class HomeViewModel: BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()
    
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var model = HomeModel()
    
    var dataSourceNoticias: BehaviorRelay<[NoticiaElementCodable]> = BehaviorRelay<[NoticiaElementCodable]>(value: [NoticiaElementCodable]())
    var dataSourceNoticiasDestaque: BehaviorRelay<[NoticiaElementCodable]> = BehaviorRelay<[NoticiaElementCodable]>(value: [NoticiaElementCodable]())
    
    func viewDidLoad() {
        
        buscarListaNoticias(page: model.currentPage)
        buscarListaNoticiasDestaque()
    }
    
    func proximaPagina() {
        if model.checarSeExisteProximaPagina() {
            self.buscarListaNoticias(page: model.nextPage)
        }
    }
    
    func buscarListaNoticias(page: Int){
        
        NoticiasClient.buscarNoticias(currentPage: page, perPage: model.perPage)
            .asObservable()
            .subscribe(
                onNext: { result in
                    if let pagination = result.pagination {
                        self.model.setPagination(pagination)
                    }
                    self.model.adicionarMaisNoticias(result.data)
                    self.dataSourceNoticias.accept(self.model.data)
                },
                onError: { error in
                    
                }
            ).disposed(by: disposable)
    }
    
    func buscarListaNoticiasDestaque(){
        NoticiasClient.buscarNoticiasDestaque()
            .asObservable()
            .subscribe(
                onNext: { result in
                    self.dataSourceNoticiasDestaque.accept(result.data)
                },
                onError: { error in
                    
                }
            ).disposed(by: disposable)
    }
}
