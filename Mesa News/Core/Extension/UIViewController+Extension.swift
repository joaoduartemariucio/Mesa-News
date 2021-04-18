//
//  UIViewController+Extension.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//
import UIKit

extension UIViewController {
    
    func mostrarMensagem(_ texto: String, completation: @escaping(Bool) -> Void = {_ in }){
        let alert = UIAlertController(
            title: Constants.App.name,
            message: texto.translate,
            preferredStyle: UIAlertController.Style.alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { (action: UIAlertAction!) in
                    completation(true)
                }
            )
        )

        present(alert, animated: true, completion: nil)
    }
    
    func showLoading(_ texto: String, completation: @escaping(Bool) -> Void = {_ in }){
    
        let alert = UIAlertController(title: nil, message: texto, preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.black
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(
            frame: CGRect(
                x: 10,
                y: 5,
                width: 50,
                height: 50)
        ) as UIActivityIndicatorView
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func hideLoading(){
        dismiss(animated: false, completion: nil)
    }
}
