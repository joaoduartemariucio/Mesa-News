//
//  ItemSwitchCustom.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 19/04/21.
//

import UIKit

class ItemSwitchCustom: UIView {

    let decoration: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var switchAtivar: UISwitch = {
        var switcha = UISwitch()
        switcha.translatesAutoresizingMaskIntoConstraints = false
        return switcha
    }()
    
    var leading: NSLayoutConstraint!
    var trailing: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        
        backgroundColor = .clear
        
        addSubview(decoration)
        addSubview(title)
        addSubview(switchAtivar)

        NSLayoutConstraint.activate([
            decoration.topAnchor.constraint(equalTo: bottomAnchor),
            decoration.leadingAnchor.constraint(equalTo: leadingAnchor),
            decoration.trailingAnchor.constraint(equalTo: trailingAnchor),
            decoration.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        leading = title.leadingAnchor.constraint(equalTo: leadingAnchor)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            leading,
            title.trailingAnchor.constraint(equalTo: switchAtivar.leadingAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        addSubview(switchAtivar)
        trailing = switchAtivar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        NSLayoutConstraint.activate([
            switchAtivar.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            trailing
        ])
    }
}
