//
//  HomeView.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import UIKit

class HomeView: UIView, BaseView {
    
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
    
    var lblNoticiasDestaques: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.text = "noticias_destaque".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        collection.register(NoticiaDestaqueCell.self, forCellWithReuseIdentifier: NoticiaDestaqueCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var lblUltimaNoticias: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.text = "ultimas_noticias".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        tableView.backgroundColor = .white
        tableView.separatorColor = .gray
        tableView.tableFooterView = UIView()
        tableView.register(UltimasNoticiasCell.self, forCellReuseIdentifier: UltimasNoticiasCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        
        setupLabelDestaques()
        setupCollectioView()
        
        setupLabelUltimasNoticias()
        setupTableView()
    }
    
    func setupLabelDestaques(){
        
        contentView.addSubview(lblNoticiasDestaques)
        NSLayoutConstraint.activate([
            lblNoticiasDestaques.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.025),
            lblNoticiasDestaques.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05)
        ])
    }
    
    func setupCollectioView(){
        
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: lblNoticiasDestaques.bottomAnchor, constant: size.height * 0.025),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: size.height * 0.40)
        ])
    }
    
    func setupLabelUltimasNoticias(){
        
        contentView.addSubview(lblUltimaNoticias)
        NSLayoutConstraint.activate([
            lblUltimaNoticias.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: size.height * 0.025),
            lblUltimaNoticias.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05)
        ])
    }
    
    func setupTableView(){
        
        contentView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lblUltimaNoticias.bottomAnchor, constant: size.height * 0.025),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size.height * 0.025)
        ])
    }
}
