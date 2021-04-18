//
//  UltimasNoticiasCell.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class UltimasNoticiasCell: UITableViewCell {
    
    static let identifier = "UltimasNoticiasCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        
    }
    
    func configCell(_ data: NoticiaCodable){
        
    }
}
