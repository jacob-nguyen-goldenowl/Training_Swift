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
    
    private lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
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
    
    func configData(image: String) {
        
        Storage.storage().reference(forURL: image).getData(maxSize: 1048576) { data, error in
            
            guard let imageData = data, error == nil else {
                return
            }
            self.imageMovie.image = UIImage(data: imageData)

        }
    }
    
}
