//
//  CadastroView.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

class CadastroView: UIView, BaseView {
    
    var scroll: UIScrollView = {
        var scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var stack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblDecricaoTela: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.text = "tela_cadastro_descricao".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtNome: FormularioField = {
        let txt = FormularioField()
        txt.setIcon(Constants.App.Image.ic_pessoa)
        txt.setPlaceHolder(text: "nome_completo".translate)
        txt.setKeyboardType(.default)
        txt.setAutoCorrection(false)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtEmail: FormularioField = {
        let txt = FormularioField()
        txt.setIcon(Constants.App.Image.ic_arroba)
        txt.setPlaceHolder(text: "email".translate)
        txt.setAutoCorrection(false)
        txt.setAutocapitalization(false)
        txt.setKeyboardType(.emailAddress)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtSenha: FormularioField = {
        let txt = FormularioField()
        txt.setIcon(Constants.App.Image.ic_senha)
        txt.setPlaceHolder(text: "senha".translate)
        txt.setSecureTextEntry(true)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtConfirmarSenha: FormularioField = {
        let txt = FormularioField()
        txt.setIcon(Constants.App.Image.ic_senha)
        txt.setPlaceHolder(text: "confirmar_senha".translate)
        txt.setSecureTextEntry(true)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var btnConfirmar: UIButton = {
        var btn = UIButton()
        btn.layer.cornerRadius = 11
        btn.backgroundColor = .colorPrimaryDark
        btn.setTitle("confirmar".translate, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
        
        setupScroll()
        setupStack()
        setupContentView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
    }
    
    func setupScroll(){
        
        addSubview(scroll)
    
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupStack(){
        
        scroll.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stack.widthAnchor.constraint(equalToConstant: size.width),
        ])
    }
    
    func setupContentView(){
        
        stack.addArrangedSubview(contentView)
        
        setupLabelDescricaoTela()
        setupTextFieldNome()
        setupTextFieldEmail()
        setupTextFieldSenha()
        setupTextFieldConfirmarSenha()
        setupButtonConfirmar()
    }
    
    func setupLabelDescricaoTela(){
        
        contentView.addSubview(lblDecricaoTela)
        NSLayoutConstraint.activate([
            lblDecricaoTela.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.025),
            lblDecricaoTela.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            lblDecricaoTela.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05)
        ])
    }
    
    func setupTextFieldNome(){
        
        contentView.addSubview(txtNome)
        NSLayoutConstraint.activate([
            txtNome.topAnchor.constraint(equalTo: lblDecricaoTela.bottomAnchor, constant: size.height * 0.05),
            txtNome.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            txtNome.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            txtNome.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTextFieldEmail(){
        
        contentView.addSubview(txtEmail)
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: txtNome.bottomAnchor, constant: size.height * 0.030),
            txtEmail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            txtEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            txtEmail.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTextFieldSenha(){
        
        contentView.addSubview(txtSenha)
        NSLayoutConstraint.activate([
            txtSenha.topAnchor.constraint(equalTo: txtEmail.bottomAnchor, constant: size.height * 0.030),
            txtSenha.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            txtSenha.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            txtSenha.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTextFieldConfirmarSenha(){
        
        contentView.addSubview(txtConfirmarSenha)
        NSLayoutConstraint.activate([
            txtConfirmarSenha.topAnchor.constraint(equalTo: txtSenha.bottomAnchor, constant: size.height * 0.030),
            txtConfirmarSenha.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            txtConfirmarSenha.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            txtConfirmarSenha.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupButtonConfirmar(){
        contentView.addSubview(btnConfirmar)
        
        NSLayoutConstraint.activate([
            btnConfirmar.topAnchor.constraint(equalTo: txtConfirmarSenha.bottomAnchor, constant: size.height * 0.10),
            btnConfirmar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            btnConfirmar.widthAnchor.constraint(equalToConstant: size.width * 0.70),
            btnConfirmar.heightAnchor.constraint(equalToConstant: 50),
            btnConfirmar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size.height * 0.05)
        ])
    }
    
    func setMensagensErro(erros: [ErrorModel<CadastroErrorType>]){
        
        if let erroNome = erros.first(where: { $0.typeError == .nomeVazio }){
            txtNome.setErrorMessage(erroNome.message)
        }
        
        if let erroEmail = erros.first(where: { $0.typeError == .emailVazio || $0.typeError == .emailInvalido }){
            txtEmail.setErrorMessage(erroEmail.message)
        }
        
        if let erroSenha = erros.first(where: { $0.typeError == .senhaVazia || $0.typeError == .senhaCurta || $0.typeError == .senhaFraca}){
            txtSenha.setErrorMessage(erroSenha.message)
        }
        
        if let erroConfirmarSenha = erros.first(where: { $0.typeError == .confirmarSenhaVazia || $0.typeError == .senhasDivergentes }){
            txtConfirmarSenha.setErrorMessage(erroConfirmarSenha.message)
        }
    }
    
    func setMensagensErro(erros: [ErrorCodable]){
        
        if let erroNome = erros.first(where: { $0.field == "name" }){
            txtNome.setErrorMessage(erroNome.message)
        }
        
        if let erroEmail = erros.first(where: { $0.field == "email" }){
            txtEmail.setErrorMessage(erroEmail.message)
        }
        
        if let erroSenha = erros.first(where: { $0.field == "password" }){
            txtSenha.setErrorMessage(erroSenha.message)
        }
        
        if let erroConfirmarSenha = erros.first(where: { $0.field == "password" }){
            txtConfirmarSenha.setErrorMessage(erroConfirmarSenha.message)
        }
    }
    
    func resetarErrosFormulario(){
        txtNome.resetarErrorMessage()
        txtEmail.resetarErrorMessage()
        txtSenha.resetarErrorMessage()
        txtConfirmarSenha.resetarErrorMessage()
    }
}
