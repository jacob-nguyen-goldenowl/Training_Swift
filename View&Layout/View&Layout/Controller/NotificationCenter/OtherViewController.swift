//
//  OtherViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 02/11/2022.
//

import UIKit

class OtherViewController: UIViewController {
    
    
    lazy var ReceiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hello", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(ReceiveButton)
        
        ReceiveButton.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 500, width: view.frame.size.width - 60, height: 50)
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: NSNotification.Name("ColorChanged"), object: nil)
        
    }
        
    @objc func notificationReceived() {
        print("received notify")
        ReceiveButton.layer.masksToBounds = true
        ReceiveButton.layer.borderWidth = 1
        ReceiveButton.layer.cornerRadius = 10
        ReceiveButton.setImage(UIImage(systemName: "bell"), for: .normal)
        ReceiveButton.setTitle("", for: .normal)
    }
    

}
