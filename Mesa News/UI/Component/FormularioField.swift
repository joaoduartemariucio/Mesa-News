//
//  FormularioField.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit
import RxGesture
import AnyFormatKit

class FormularioField: UIView, BaseView {
    
    let disposable = DisposeBag()
    
    let inputControllerFormater = TextFieldInputController()

    var text: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var selectedColor = UIColor.colorPrimary
    var unselectedColor = UIColor.lightGray
    var textoVisivel = false
    var isExitentErro = false
    
    private var icone: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var field: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var btnPassword: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        let visivel = UIImage(named: Constants.App.Image.ic_password_visivel)?.withRenderingMode(.alwaysTemplate)
        img.image = visivel
        img.isHidden = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var lblErrorMessage: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .red
        lbl.isHidden = true
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        setupLayer()
        setupIcone()
        setupButton()
        setupField()
        setupLabelError()
        setupControleEventos()
    }
    
    func setupLayer(){
        icone.tintColor = unselectedColor
        btnPassword.tintColor = unselectedColor
        layer.borderColor = unselectedColor.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 11
    }
    
    func setupIcone(){
        addSubview(icone)
        NSLayoutConstraint.activate([
            icone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            icone.widthAnchor.constraint(equalToConstant: 24),
            icone.heightAnchor.constraint(equalToConstant: 24),
            icone.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupButton(){
        addSubview(btnPassword)
        NSLayoutConstraint.activate([
            btnPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            btnPassword.widthAnchor.constraint(equalToConstant: 24),
            btnPassword.heightAnchor.constraint(equalToConstant: 24),
            btnPassword.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupField(){
        
        addSubview(field)
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: topAnchor),
            field.leadingAnchor.constraint(equalTo: icone.trailingAnchor, constant: 10),
            field.trailingAnchor.constraint(equalTo: btnPassword.leadingAnchor, constant: -10),
            field.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupLabelError(){
        
        addSubview(lblErrorMessage)
        NSLayoutConstraint.activate([
            lblErrorMessage.topAnchor.constraint(equalTo: bottomAnchor),
            lblErrorMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lblErrorMessage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func setupControleEventos() {
        
        field.rx.controlEvent(.editingDidBegin).bind {
            self.setupEditandoTexto()
        }.disposed(by: disposable)
        
        field.rx.controlEvent(.editingDidEnd).bind {
            self.setupEdicaoFinalizada()
        }.disposed(by: disposable)
        
        field.rx.controlEvent(
            [
                .editingDidEndOnExit,
                .touchDragOutside
            ]
        ).bind {
            self.field.resignFirstResponder()
        }.disposed(by: disposable)
        
        field.rx
            .text
            .orEmpty
            .bind(to: text)
            .disposed(by: disposable)
    }
    
    func setFormatter(formatter: DefaultTextInputFormatter){
        field.delegate = inputControllerFormater
        inputControllerFormater.formatter = formatter
    }
    
    func setupEditandoTexto(){
        if isExitentErro { return }
        layer.borderColor = selectedColor.cgColor
        tintColor = selectedColor
        field.textColor = unselectedColor
        icone.tintColor = selectedColor
    }
    
    func setupEdicaoFinalizada(){
        if isExitentErro { return }
        layer.borderColor = unselectedColor.cgColor
        tintColor = unselectedColor
        field.textColor = unselectedColor
        icone.tintColor = unselectedColor
    }
    
    func setIcon(_ named: String){
        let img = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
        icone.image = img
    }
    
    func setKeyboardType(_ type: UIKeyboardType){
        field.keyboardType = type
    }
    
    func setAutoCorrection(_ active: Bool) {
        field.autocorrectionType = active ? .no : .yes
    }
    
    func setAutocapitalization(_ active: Bool){
        field.autocapitalizationType = !active ? .none : .sentences
    }
    
    func setSecureTextEntry(_ active: Bool){
    
        btnPassword.isHidden = !active
        
        let visivel = UIImage(named: Constants.App.Image.ic_password_visivel)?.withRenderingMode(.alwaysTemplate)
        let invisivel = UIImage(named: Constants.App.Image.ic_password_invisivel)?.withRenderingMode(.alwaysTemplate)

        btnPassword.rx.tapGesture().bind { _ in
            self.textoVisivel = !self.textoVisivel
            self.field.isSecureTextEntry = self.textoVisivel
            self.btnPassword.image = self.textoVisivel ? visivel : invisivel
        }.disposed(by: disposable)
    }
    
    func setPlaceHolder(text: String){
        field.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: unselectedColor,
                .font: UIFont.boldSystemFont(ofSize: 16)
            ]
        )
    }
    
    func setErrorMessage(_ message: String) {
        lblErrorMessage.isHidden = false
        lblErrorMessage.text = "\(message)"
        layer.borderColor = UIColor.red.cgColor
        icone.tintColor = .red
        field.textColor = .red
        btnPassword.tintColor = .red
        isExitentErro = true
    }
    
    func resetarErrorMessage(){
        lblErrorMessage.isHidden = true
        lblErrorMessage.text = ""
        layer.borderColor = unselectedColor.cgColor
        icone.tintColor = unselectedColor
        field.textColor = unselectedColor
        btnPassword.tintColor = unselectedColor
        isExitentErro = false
    }
}
