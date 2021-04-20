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
    
    func configCell(_ element: NoticiaElementCodable){
        
        lblTituloNoticia.text = element.title
        lblDescricaoNoticia.text = element.descricao
        
        imagemNoticia.setImageURL(
            url: element.imageURL ?? "",
            mode: .scaleAspectFill,
            color: nil
        )
    }
}
