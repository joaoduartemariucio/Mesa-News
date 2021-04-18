//
//  UIView+Extensions.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import UIKit

extension UIView {
    
    static var shared = UIView()
    
    var size: CGSize {
        get {
            return UIScreen.main.bounds.size
        }
    }
}
