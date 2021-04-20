//
//  UltimasNoticiasCell.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class UltimasNoticiasCell: UITableViewCell {
    
    static let identifier = "UltimasNoticiasCell"
    
    var imagemNoticia: IconeView = {
        var img = IconeView()
        img.layer.cornerRadius = 11
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var lblTituloNoticia: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblDescricaoNoticia: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 14)
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        setupImagemNoticia()
        setupTituloNoticia()
        setupDescricaoNoticia()
        setupFavoritarNoticia()
    }
    
    func setupImagemNoticia(){
        
        contentView.addSubview(imagemNoticia)
        NSLayoutConstraint.activate([
            imagemNoticia.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.025),
            imagemNoticia.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  size.width * 0.05),
            imagemNoticia.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size.height * 0.025),
            imagemNoticia.widthAnchor.constraint(equalToConstant: size.width * 0.25),
            imagemNoticia.heightAnchor.constraint(equalToConstant: size.height * 0.12)
        ])
    }
        
    func setupTituloNoticia() {
        
        contentView.addSubview(lblTituloNoticia)
        NSLayoutConstraint.activate([
            lblTituloNoticia.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.025),
            lblTituloNoticia.leadingAnchor.constraint(equalTo: imagemNoticia.trailingAnchor, constant: size.width * 0.025),
            lblTituloNoticia.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.025),
            lblTituloNoticia.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setupDescricaoNoticia() {
        
        contentView.addSubview(lblDescricaoNoticia)
        NSLayoutConstraint.activate([
            lblDescricaoNoticia.topAnchor.constraint(equalTo: lblTituloNoticia.bottomAnchor),
            lblDescricaoNoticia.leadingAnchor.constraint(equalTo: imagemNoticia.trailingAnchor, constant: size.width * 0.025),
            lblDescricaoNoticia.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
        ])
    }
    
    func setupFavoritarNoticia(){
        contentView.addSubview(imgFavoritarNoticia)
        NSLayoutConstraint.activate([
            imgFavoritarNoticia.topAnchor.constraint(equalTo: imagemNoticia.topAnchor, constant:  size.width * 0.015),
            imgFavoritarNoticia.trailingAnchor.constraint(equalTo: imagemNoticia.trailingAnchor, constant: -size.width * 0.010),
            imgFavoritarNoticia.widthAnchor.constraint(equalToConstant: 26),
            imgFavoritarNoticia.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    func configCell(_ element: NoticiaModel){
        
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
