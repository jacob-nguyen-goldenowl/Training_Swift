//
//  TextFiledViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN
    - An object that displays an editable text area in your interface.
 
 */

import UIKit

class TextFiledViewController: UIViewController {
    
    // Create text field 1
    lazy var tf1: UITextField = {
        let text = UITextField()
        text.borderStyle = .bezel
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Enter text here..."
        return text
    }()
    
    // Create text field 2
    lazy var tf2: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Enter text here..."
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tf1)
        view.addSubview(tf2)
        
        let overlayButton = UIButton(type: .custom)
        let bookmarkImage = UIImage(systemName: "bookmark")
        overlayButton.setImage(bookmarkImage, for: .normal)
        overlayButton.addTarget(self, action: #selector(displayBookmarks), 
                                for: .touchUpInside)
        overlayButton.sizeToFit()
        
        // Assign the overlay button to the text field
        tf2.leftView = overlayButton
        tf2.leftViewMode = .always
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            tf1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tf1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            tf1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tf1.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tf2.topAnchor.constraint(equalTo: tf1.bottomAnchor, constant: 50),
            tf2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            tf2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tf2.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func displayBookmarks() {
        
    }

}
