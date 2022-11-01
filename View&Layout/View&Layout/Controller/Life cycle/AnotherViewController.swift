//
//  AnotherViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import UIKit

class AnotherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("another load view is running...")
        view.backgroundColor = .systemMint
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("another view will appear is running...")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("another view did appear is running...")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("another view will disappear is running...")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("another view did disappear is running...")
    }

}
