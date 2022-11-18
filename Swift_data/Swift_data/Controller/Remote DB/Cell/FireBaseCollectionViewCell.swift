//
//  FireBaseCollectionViewCell.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 15/11/2022.
//

import UIKit
import FirebaseStorage

class FireBaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "FireBaseCollectionViewCell"

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    private func setupLayout() {
        contentView.addSubview(imageView)
        imageView.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
        
}
