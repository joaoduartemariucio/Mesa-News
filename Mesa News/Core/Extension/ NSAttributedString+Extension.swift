//
//   NSAttributedString+Extension.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

extension NSAttributedString {
    
    static func attributeText(text1: String, text2: String, size: CGFloat) -> NSMutableAttributedString {
            
        let attribute1: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "HelveticaNeue-Bold", size: size)!
        ]
        
        let attribute2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.colorPrimary,
            .font: UIFont(name: "HelveticaNeue-Bold", size: size)!
        ]

        let attributedString1 = NSAttributedString(string: text1, attributes: attribute1)
        let attributedString2 = NSAttributedString(string: text2, attributes: attribute2)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attributedString1)
        mutableAttributedString.append(attributedString2)
        
        return mutableAttributedString
    }
}
