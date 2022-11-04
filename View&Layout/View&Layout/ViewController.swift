//
//  ViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import UIKit

class ViewController: UIViewController {
        
    private var nameModule = ["Life cycle", "UIView", "Frame/Bound", "NSLayoutConstraint", "UIViewController", "UINavigationController","Label","Button", "TextField", "TextView", "TableView", "CollectionView", "ScrollView", "StackView", "Tabbar", "NotificationCenter"]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTableView()
//        configureNavigationBar()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }
        
    private func configureNavigationBar() {
                        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(tap))
        let bookMarkItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tap))
        
        let settingItem = UIBarButtonItem(image: UIImage(systemName: "mic.fill") , style: .plain, target: self, action: #selector(tap))
        
        navigationItem.rightBarButtonItems = [searchItem, bookMarkItem]
        navigationItem.leftBarButtonItem = settingItem
        
        navigationController?.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple.withAlphaComponent(0.6)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.green]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameModule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        let type = nameModule[indexPath.row]
        cell.textLabel?.text = type
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nameIndex = nameModule[indexPath.row]
        switch(indexPath.row) {
            case 0:
                let vc = LifeCycleViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = UIViewViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 2: 
                let vc = Frame_BoundViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 3:
                let vc = NSLayoutConstraintViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 4: 
                let vc = UIVCViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 5:
                let vc = UINaviViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 6:
                let vc = UILabelViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 7:
                let vc = ButtonViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 8:
                let vc = TextFiledViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 9:
                let vc = TextViewViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 10:
//                let vc = UINavigationController(rootViewController: TableViewViewController())
//                vc.modalPresentationStyle = .fullScreen
//                present(vc, animated: true)
                let vc = TableViewViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 11:
                let vc = CollectionViewViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 12:
                let vc = ScrollViewViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 13:
                let vc = StackViewViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            case 14:
                let vc = UINavigationController(rootViewController: TabbarViewController())
                vc.title = nameIndex
                present(vc, animated: true)
                
            case 15:
                let vc = NotificationCenterViewController()
                vc.title = nameIndex
                navigationController?.pushViewController(vc, animated: true)
            default:
                print("nil view")
        }
    }
    
    @objc func tap() {
        
    }
}



