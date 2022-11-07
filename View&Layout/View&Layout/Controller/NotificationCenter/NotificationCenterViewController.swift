//
//  NotificationCenterViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import UIKit

class NotificationCenterViewController: UIViewController {
    
    var count = 0

    lazy var notifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send notify", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapedObseverChangeColor), for: .touchUpInside)
        return button
    }()
    
    lazy var receiveLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Receive notifications 0 times."
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUI()
        receiveNotify()
        self.hidenTitleBackButton()
    }
    
    private func setUpUI() {
        view.addSubview(notifyButton)
        view.addSubview(receiveLabel)
        
        notifyButton.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 200, width: view.frame.size.width - 60, height: 50)
        
        receiveLabel.frame = CGRect(x: 30, y: notifyButton.frame.size.height + 350, width: view.frame.size.width - 60, height: 50)
    }
    
    @objc func didTapedObseverChangeColor(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ColorChanged"), object: nil)
    }
    
    private func receiveNotify() {
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: NSNotification.Name("ColorChanged"), object: nil)
    }
    
    @objc func notificationReceived() {
        count += 1
        receiveLabel.text = "Receive notifications \(count) times."
    }
    
    
}
