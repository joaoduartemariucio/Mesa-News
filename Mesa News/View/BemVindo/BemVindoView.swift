//
//  BemVindoView.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class BemVindoView: UIView, BaseView {
    
    var imagemLogo: UIImageView = {
        var image  = UIImageView()
        let img = UIImage(named: Constants.App.Image.logo_app)
        image.image = img
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints =  false
        return image
    }()
    
    var lblBemVindo: UILabel = {
        var lbl = UILabel()
        lbl.attributedText = NSAttributedString.attributeText(
            text1: "bem_vindo".translate,
            text2: Constants.App.name,
            size: 52
        )
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblBemVindoDescricao: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "bem_vindo_descricao".translate
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var btnCadastreSe: UIButton = {
        var btn = UIButton()
        btn.layer.cornerRadius = 11
        btn.backgroundColor = .colorPrimaryDark
        btn.setTitle("cadastre_se".translate, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btnEntrar: UIButton = {
        var btn = UIButton()
        btn.layer.cornerRadius = 11
        btn.backgroundColor = .white
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.colorPrimary.cgColor
        btn.setTitle("entrar".translate, for: .normal)
        btn.setTitleColor(.colorPrimaryDark, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews() {

        backgroundColor = .white
        
        setupLogo()
        setupTitulo()
        setupBemVindoDescricao()
        setupButtonEntrar()
        setupButtonCadastrar()
    }
    
    func setupLogo() {
        
        addSubview(imagemLogo)
        NSLayoutConstraint.activate([
            imagemLogo.topAnchor.constraint(equalTo: topAnchor, constant: size.height * 0.125),
            imagemLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.width * 0.075),
            imagemLogo.heightAnchor.constraint(equalToConstant: size.height * 0.20),
            imagemLogo.widthAnchor.constraint(equalToConstant: size.width * 0.20)
        ])
    }
    
    func setupTitulo() {
        
        addSubview(lblBemVindo)
        NSLayoutConstraint.activate([
            lblBemVindo.topAnchor.constraint(equalTo: imagemLogo.bottomAnchor),
            lblBemVindo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.width * 0.075),
            lblBemVindo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.width * 0.075)
        ])
    }
    
    func setupBemVindoDescricao() {
        
        addSubview(lblBemVindoDescricao)
        NSLayoutConstraint.activate([
            lblBemVindoDescricao.topAnchor.constraint(equalTo: lblBemVindo.bottomAnchor, constant: size.height * 0.025),
            lblBemVindoDescricao.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.width * 0.075),
            lblBemVindoDescricao.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.width * 0.10)
        ])
    }
    
    func setupButtonCadastrar() {
        addSubview(btnCadastreSe)
        NSLayoutConstraint.activate([
            btnCadastreSe.bottomAnchor.constraint(equalTo: btnEntrar.topAnchor, constant: -size.height * 0.015),
            btnCadastreSe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.width * 0.075),
            btnCadastreSe.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.width * 0.075),
            btnCadastreSe.heightAnchor.constraint(equalToConstant: size.height * 0.075)
        ])
    }

    func setupButtonEntrar() {
        addSubview(btnEntrar)
        NSLayoutConstraint.activate([
            btnEntrar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -size.height * 0.05),
            btnEntrar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.width * 0.075),
            btnEntrar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.width * 0.075),
            btnEntrar.heightAnchor.constraint(equalToConstant: size.height * 0.075)
        ])
    }
}
