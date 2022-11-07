//
//  LifeCycleViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 
 LEARN 
 - Life cycle of view controller
 
    + Load view: The function will be called first when initializing a view controller.
    + viewDidLoad: When the view controller have been loaded into memory ( View controller does not alrealy exist in memory), just called only in the life of that view.
    + viewWillAppear: Will be called before a view is added to the view system and before the animation renders a view.
    + viewDidAppear: Will be called when a view has been added to the view system and displayed on the screen.
    + viewWillDisAppear: Called when a view has been hidden from the screen and animation when the view is hidden.
    + viewDidDisAppear: Call when a view is hidden from the screen.
 - Warning from system
    + viewDidUnload: When app receives a warning from system about low memory status, this function will release unnecessary properties, assign nil them. 
 
 */

import UIKit

class LifeCycleViewController: UIViewController {
    
    lazy var lifeCycleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Life cycle", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(didTapChangeViewController), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        print("Load view")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did load view is running...")
        view.backgroundColor = .systemBackground
        view.addSubview(lifeCycleButton)
        self.hidenTitleBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear is running...")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear is running...")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear is running...")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear is running...")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureConstraintButton()
    }
    
    private func configureConstraintButton() {
        NSLayoutConstraint.activate([
            lifeCycleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lifeCycleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            lifeCycleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            lifeCycleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func didTapChangeViewController() {
        let vc = AnotherViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
