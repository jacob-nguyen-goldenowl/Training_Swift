//
//  NSLayoutConstraintViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import UIKit

class NSLayoutConstraintViewController: UIViewController {

    // Create first view
    lazy var fv: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 20
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 5
        return view
    }()
    
    // Create first image
    lazy var fi: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "image1")
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(fv)
        fv.addSubview(fi)
        self.hidenTitleBackButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            fv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            fv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            fv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            fv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            // Constaint image view
            
            fi.centerXAnchor.constraint(equalTo: fv.centerXAnchor),
            fi.centerYAnchor.constraint(equalTo: fv.centerYAnchor),
            fi.widthAnchor.constraint(equalToConstant: 200),
            fi.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    



}
