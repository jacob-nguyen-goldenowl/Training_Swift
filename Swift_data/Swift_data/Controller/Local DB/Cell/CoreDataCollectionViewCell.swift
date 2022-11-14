//
//  CoreDataCollectionViewCell.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 11/11/2022.
//

import UIKit

class CoreDataCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CoreDataCollectionViewCell"
    
    private lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
       // image.image = UIImage(named: "imageDefault")
        image.layer.cornerRadius = 10
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(imageMovie)
        imageMovie.anchor( top: topAnchor,
                           bottom: bottomAnchor,
                           leading: leadingAnchor,
                           trailing: trailingAnchor)
    }
    
    func configData(image: Data) {
        imageMovie.image = UIImage(data: image)
    }
    
}
