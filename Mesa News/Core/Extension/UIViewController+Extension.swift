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
}
