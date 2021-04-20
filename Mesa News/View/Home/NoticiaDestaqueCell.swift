//
//  HomeViewNoticiasCell.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class NoticiaDestaqueCell: UICollectionViewCell {
    
    static let identifier = "NoticiaDestaqueCell"
        
    var view: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 11
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imagemNoticia: IconeView = {
        var img = IconeView()
        img.layer.cornerRadius = 11
        img.clipsToBounds = true
        img.setTintColor(.white)
        img.settingOpacityColor(color: .black, opacity: 0.50)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var lblTituloNoticia: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblDescricaoNoticia: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var imgFavoritarNoticia: IconeView = {
        var img = IconeView()
        img.setIcone(named: Constants.App.Image.ic_noticia_nao_favoritada, mode: .scaleAspectFit)
        img.setTintColor(.white)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){

        setupView()
        setupImagemNoticia()
        setupDescricaoNoticia()
        setupTituloNoticia()
        setupFavoritarNoticia()
    }
    
    func setupView(){
        
        contentView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupImagemNoticia(){
        
        view.addSubview(imagemNoticia)
        NSLayoutConstraint.activate([
            imagemNoticia.topAnchor.constraint(equalTo: view.topAnchor),
            imagemNoticia.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagemNoticia.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imagemNoticia.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupDescricaoNoticia() {
        
        view.addSubview(lblDescricaoNoticia)
        NSLayoutConstraint.activate([
            lblDescricaoNoticia.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -size.height * 0.025),
            lblDescricaoNoticia.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: size.width * 0.025),
            lblDescricaoNoticia.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -size.width * 0.05)
        ])
    }
        
    func setupTituloNoticia() {
        
        view.addSubview(lblTituloNoticia)
        NSLayoutConstraint.activate([
            lblTituloNoticia.bottomAnchor.constraint(equalTo: lblDescricaoNoticia.topAnchor, constant: -size.height * 0.025),
            lblTituloNoticia.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: size.width * 0.025),
            lblTituloNoticia.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -size.width * 0.025)
        ])
    }
    
    func setupFavoritarNoticia(){
        view.addSubview(imgFavoritarNoticia)
        NSLayoutConstraint.activate([
            imgFavoritarNoticia.topAnchor.constraint(equalTo: view.topAnchor, constant:  size.width * 0.05),
            imgFavoritarNoticia.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -size.width * 0.05),
            imgFavoritarNoticia.widthAnchor.constraint(equalToConstant: 32),
            imgFavoritarNoticia.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func configCell(_ element: NoticiaModel) {
        
        lblTituloNoticia.text = element.title
        lblDescricaoNoticia.text = element.descricao
        
        imagemNoticia.setImageURL(
            url: element.imageURL,
            mode: .scaleAspectFill,
            color: nil
        )
        
        if element.checarSeFoiFavoritada() {
            imgFavoritarNoticia.setIcone(named: Constants.App.Image.ic_noticia_favoritada, mode: .scaleAspectFit)
        }else {
            imgFavoritarNoticia.setIcone(named: Constants.App.Image.ic_noticia_nao_favoritada, mode: .scaleAspectFit)
        }
    }
}
