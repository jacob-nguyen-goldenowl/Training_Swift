//
//  Frame&BoundViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN 
 - frame: The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
 - bounds: The bounds rectangle, which describes the view’s location and size in its own coordinate system.
 */

import UIKit

class Frame_BoundViewController: UIViewController {
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.red.cgColor
        image.image = UIImage(named: "image")
        return image
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(imageView)
        
            // Using frame
        redView.frame = CGRect(x: 50, y: view.safeAreaInsets.top + 100, width: 100, height: 100)
        
            // Using bound
        blueView.bounds = CGRect(x: 50, y: view.safeAreaInsets.top + 100, width: 100, height: 100)
        
        imageView.frame = CGRect(x: 50, y: view.safeAreaInsets.top + blueView.frame.size.height + 200, width: 300, height: 300)
        imageView.bounds = CGRect(x: 10, y: 10, width: 100, height: 100)
        imageView.transform = CGAffineTransform(rotationAngle: 10)
    }
    
    
}
