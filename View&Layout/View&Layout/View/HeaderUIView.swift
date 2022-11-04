//
//  HeaderUIView.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 04/11/2022.
//

import UIKit


class HeaderUIView: UIView {
    
    
    private let containtView = UIView()
    
    public let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        addGradient()
        
    }
    
    private func createViews() {
        addSubview(containtView)
        containtView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        containtView.addSubview(headerImageView)
    }
    
    override func layoutSubviews() {
        headerImageView.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer() 
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

}
