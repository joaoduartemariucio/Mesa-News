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
        presentationView.scroll.rx.setDelegate(self).disposed(by: disposable)
        
        presentationView.tableView.rx.willDisplayCell.bind { willDisplay in
            if willDisplay.indexPath.row + 1 == self.viewModel.dataSourceNoticias.value.count {
                self.viewModel.proximaPagina()
            }
        }.disposed(by: disposable)
        
        presentationView.collectionView.rx.itemSelected.bind { index in
            let noticia = self.viewModel.dataSourceNoticiasDestaque.value[index.row]
            self.coordinator?.abrirNoticia(url: noticia.url)
        }.disposed(by: disposable)
        
        presentationView.tableView.rx.itemSelected.bind { index in
            let noticia = self.viewModel.dataSourceNoticias.value[index.row]
            self.coordinator?.abrirNoticia(url: noticia.url)
        }.disposed(by: disposable)
        
        viewModel.feedback.bind { value in
            if value == .item_destaque_favoritado {
                self.presentationView.tableView.reloadData()
                self.presentationView.collectionView.reloadData()
            }
        }.disposed(by: disposable)
        
        viewModel.dataSourceNoticiasDestaque
            .bind(
                to: presentationView.collectionView
                    .rx
                    .items(
                        cellIdentifier: NoticiaDestaqueCell.identifier,
                        cellType: NoticiaDestaqueCell.self
                    )
            ) { row, data, cell in
                cell.configCell(data)
                cell.imgFavoritarNoticia.tag = row
                let gesture = UITapGestureRecognizer(target: self, action: #selector(self.favoritarNoticiaDestaque(_:)))
                cell.imgFavoritarNoticia.addGestureRecognizer(gesture)
            }.disposed(by: disposable)
        
        viewModel.dataSourceNoticias
            .bind(
                to: presentationView
                    .tableView
                    .rx
                    .items(
                        cellIdentifier: UltimasNoticiasCell.identifier,
                        cellType: UltimasNoticiasCell.self
                    )
            ) { row, data, cell in
                cell.selectionStyle = .none
                cell.configCell(data)
                cell.imgFavoritarNoticia.tag = row
                let gesture = UITapGestureRecognizer(target: self, action: #selector(self.favoritarNoticia(_:)))
                cell.imgFavoritarNoticia.addGestureRecognizer(gesture)
            }.disposed(by: disposable)
    }
    
    @objc func favoritarNoticiaDestaque(_ tap: UITapGestureRecognizer){
        guard let view = tap.view as? IconeView else { return }
        let noticia = viewModel.dataSourceNoticiasDestaque.value[view.tag]
        viewModel.favoritarNoticia(noticia: noticia.codableNoticia)
    }
    
    @objc func favoritarNoticia(_ tap: UITapGestureRecognizer){
        guard let view = tap.view as? IconeView else { return }
        let noticia = viewModel.dataSourceNoticias.value[view.tag]
        viewModel.favoritarNoticia(noticia: noticia.codableNoticia)
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

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.presentationView.tableView.isScrollEnabled = scrollView.bounds.contains(self.presentationView.tableView.frame)
    }
}
