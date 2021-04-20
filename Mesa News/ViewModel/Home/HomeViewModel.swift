//
//  HomeViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation
import RxSwiftExt

enum HomeStatus {
    case item_destaque_favoritado, `default`
}

protocol HomeViewModelInput {
    
    func proximaPagina()
    func favoritarNoticiaDestaque(noticia: NoticiaElementCodable)
}

protocol HomeViewModelOutput {
    
    var feedback: BehaviorRelay<HomeStatus> { get set }
    var dataSourceNoticias: BehaviorRelay<[NoticiaModel]> { get set }
    var dataSourceNoticiasDestaque: BehaviorRelay<[NoticiaElementCodable]> { get set}
}

class HomeViewModel: BaseViewModel, HomeViewModelInput, HomeViewModelOutput {
    
    //    MARK: HomeViewModel Outputs
    var dataSourceNoticias: BehaviorRelay<[NoticiaModel]> = BehaviorRelay<[NoticiaModel]>(value: [NoticiaModel]())
    var dataSourceNoticiasDestaque: BehaviorRelay<[NoticiaElementCodable]> = BehaviorRelay<[NoticiaElementCodable]>(value: [NoticiaElementCodable]())
    
    var feedback: BehaviorRelay<HomeStatus> = BehaviorRelay<HomeStatus>(value: .default)
    
    //    MARK: BaseViewModel e functions
    var disposable: DisposeBag = DisposeBag()
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var model = HomeModel()
    
    func viewDidLoad() {
        
        buscarListaNoticias(page: model.currentPage)
        buscarListaNoticiasDestaque()
    }
    
    func buscarListaNoticias(page: Int){
        
        NoticiasClient.buscarNoticias(currentPage: page, perPage: model.perPage)
            .asObservable()
            .subscribe(
                onNext: { result in
                    if let pagination = result.pagination {
                        self.model.setPagination(pagination)
                    }
                    self.adicionarNoticiasDataSource(result.data)
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
    
    func adicionarNoticiasDataSource(_ novasNoticias: [NoticiaElementCodable]){
        
        var noticias = dataSourceNoticias.value
        let novasNoticiasMap = novasNoticias.map( { NoticiaModel(codable: $0) } )
        
        noticias.append(contentsOf: novasNoticiasMap)
        
        let noticiasOrdenadas = noticias.sorted(by: { $0.publishedAt.compare($1.publishedAt) == .orderedDescending })
        
        model.setNoticias(noticiasOrdenadas)
        
        self.dataSourceNoticias.accept(noticiasOrdenadas)
    }
    
    //    MARK: HomeViewModel Inputs
    func proximaPagina() {
        if model.checarSeExisteProximaPagina() {
            self.buscarListaNoticias(page: model.nextPage)
        }
    }
    
    func favoritarNoticiaDestaque(noticia: NoticiaElementCodable) {
        var dataArray = PreferencesHelper.instance.getDataArray(key: Constants.App.Keys.noticias_destaque_favoritadas)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(noticia) {
            
            if !dataArray.contains(encoded) {
                dataArray.append(encoded)
            }else {
                dataArray.removeAll(where: { $0 == encoded })
            }
            self.feedback.accept(.item_destaque_favoritado)
            PreferencesHelper.instance.save(key: Constants.App.Keys.noticias_destaque_favoritadas, value: dataArray)
        }
    }
}
