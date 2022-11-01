//
//  ButtonViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import UIKit

class ButtonViewController: UIViewController {
    
        // Create first button
    lazy var fb: UIButton = {
        let button = UIButton()
        button.setTitle("First button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        return button
    }()
    
        // Create secondbutton
    lazy var sb: UIButton = {
        let button = UIButton()
        button.setTitle("Second button", for: .normal)
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(fb)
        view.addSubview(sb)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            fb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fb.widthAnchor.constraint(equalToConstant: 150),
            fb.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            sb.topAnchor.constraint(equalTo: fb.bottomAnchor, constant: 20),
            sb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sb.widthAnchor.constraint(equalToConstant: 200),
            sb.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func didTapFirstButton() {
        print("Did tapped frist button ....")
    }
    
    @objc func didTapSecondButton() {
        print("Did tapped second button ....")
    }
    
}

