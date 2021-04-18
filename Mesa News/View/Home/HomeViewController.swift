//
//  HomeViewController.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class HomeViewController: UIViewController, BaseViewController {
    
    typealias View = HomeView
    typealias ViewModel = HomeViewModel
    typealias Navigation = HomeCoordinator
    
    var coordinator: HomeCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: HomeViewModel = HomeViewModel()
    var presentationView: HomeView = HomeView()
    
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "tela_home".translate
        
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
        presentationView.collectionView.rx.setDelegate(self).disposed(by: disposable)
        
        presentationView.collectionView.rx
                    .itemSelected
                    .bind { index in
                        print(index)
                    }.disposed(by: disposable)
        
        viewModel.noticias
                    .bind(
                        to: presentationView
                            .collectionView
                            .rx
                            .items(
                                cellIdentifier: NoticiaDestaqueCell.identifier,
                                cellType: NoticiaDestaqueCell.self
                            )
                    ) { row, data, cell in
                        cell.configCell(data)
                    }.disposed(by: disposable)
        
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIView.shared.size.width * 0.05, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIView.shared.size.width * 0.05, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / 1.20
        let height = UIView().size.height * 0.38
        return CGSize(width: width, height: height)
    }
}



