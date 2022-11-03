//
//  NotificationCenterViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import UIKit

class NotificationCenterViewController: UIViewController {
    
    lazy var NotifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send notify", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapedObseverChangeColor), for: .touchUpInside)
        return button
    }()
    
    lazy var NaviButton: UIButton = {
        let button = UIButton()
        button.setTitle("Navigation", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapNavigation), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(NotifyButton)
        view.addSubview(NaviButton)
        
        NotifyButton.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 200, width: view.frame.size.width - 60, height: 50)
        
        NaviButton.frame = CGRect(x: 30, y: NotifyButton.frame.size.height + 500, width: view.frame.size.width - 60, height: 50)
        
    }
    
    @objc func didTapedObseverChangeColor(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ColorChanged"), object: nil)
    }
    
    @objc func didTapNavigation(_ sender: UIButton) {
        let vc = OtherViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
