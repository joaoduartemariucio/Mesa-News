//
//  TranslateHelper.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation

class TranslateHelper {
    
    class func translate(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
