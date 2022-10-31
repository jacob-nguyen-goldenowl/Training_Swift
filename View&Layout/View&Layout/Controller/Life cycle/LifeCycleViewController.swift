//
//  LifeCycleViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load view is running...")
        view.backgroundColor = .systemBackground
        view.addSubview(lifeCycleButton)
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
