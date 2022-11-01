//
//  HeaderReusableView.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 01/11/2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderReusableView"
    
    lazy var lb: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lb)
    }
    
    override func layoutSubviews() {
        lb.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(name: String) {
        lb.text = name
    }
    
}
