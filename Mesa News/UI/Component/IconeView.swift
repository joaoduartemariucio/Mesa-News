//
//  IconeView.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

import UIKit
import Nuke

class IconeView: UIView, BaseView {
    
    var iconTintColor: UIColor = .white
    
    private var icone: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var opacityLayer: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        addSubview(icone)
        NSLayoutConstraint.activate([
            icone.topAnchor.constraint(equalTo: topAnchor),
            icone.leadingAnchor.constraint(equalTo: leadingAnchor),
            icone.trailingAnchor.constraint(equalTo: trailingAnchor),
            icone.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(opacityLayer)
        NSLayoutConstraint.activate([
            opacityLayer.topAnchor.constraint(equalTo: topAnchor),
            opacityLayer.leadingAnchor.constraint(equalTo: leadingAnchor),
            opacityLayer.trailingAnchor.constraint(equalTo: trailingAnchor),
            opacityLayer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setImageURL(url: String, mode: UIView.ContentMode, color: UIColor?) {
        
        if let url = URL(string: url) {
            var options = ImageLoadingOptions(
                placeholder: UIImage(named: Constants.App.Image.fake_blur_image),
                transition: .fadeIn(duration: 0.25),
                failureImage: UIImage(named: Constants.App.Image.fake_blur_image),
                contentModes: .init(success: mode, failure: mode, placeholder: mode)
            )
            
            if let color = color {
                iconTintColor = color
                options.tintColors = .init(success: color, failure: color, placeholder: color)
            }
            
            Nuke.loadImage(with: url, options: options, into: icone)
        }
    }
    
    func setIcone(named: String, mode: UIView.ContentMode) {
        
        if let image = UIImage(named: named) {
            icone.image = image.withRenderingMode(.alwaysTemplate)
        }
        
        icone.contentMode = mode
    }
    
    func setTintColor(_ color: UIColor){
        icone.tintColor = color
    }
    
    func settingOpacityColor(color: UIColor, opacity: CGFloat) {
        opacityLayer.backgroundColor = color
        opacityLayer.alpha = opacity
    }
}
