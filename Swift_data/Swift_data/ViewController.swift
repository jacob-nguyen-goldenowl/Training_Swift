//
//  ViewController.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 07/11/2022.
//

import UIKit

struct DataModel {
    let lblSection: String?
    let lblCell: [String]?
    
    init(lblSection: String?, lblCell: [String]?) {
        self.lblSection = lblSection
        self.lblCell = lblCell
    }
    
}

class ViewController: UIViewController {

    private var dataTableView = [DataModel]()
        
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 16.0, *) {
            setupNavigationController()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.anchor( top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          leading: view.safeAreaLayoutGuide.leadingAnchor,
                          trailing: view.safeAreaLayoutGuide.trailingAnchor)
        addLabelForTableView()
    }
    
    private func addLabelForTableView() {
        dataTableView.append(DataModel.init(lblSection: "Short & sensitive data", lblCell: ["User Default", "Keychain Access"]))
        dataTableView.append(DataModel.init(lblSection: "Local DB", lblCell: ["Core Data", "Realm", "SQLite", "File"]))
        dataTableView.append(DataModel.init(lblSection: "Remote DB", lblCell: ["Firebase - Firestore", "API"]))
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setNeedsLayout()
//        navigationController?.isNavigationBarHidden = true
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataTableView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTableView[section].lblCell?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataTableView[section].lblSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataTableView[indexPath.section].lblCell?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            case 0:
                switch indexPath.row {
                    case 0:
                        let vc = UserDefaultViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    case 1: 
                        let vc = KeychainViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    default: 
                        print("Something error when navigation view")
                        
                }
            case 1: 
                switch indexPath.row {
                    case 0:
                        let vc = CoreDataViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    case 1: 
                        let vc = RealmViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    case 2: 
                        let vc = SQLiteViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    case 3: 
                        let vc = FileViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    default:
                        print("Something error when navigation view")
                }
            case 2: 
                switch indexPath.row {
                    case 0:
                        let vc = FireBaseViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    case 1:
                        let vc = APIViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    default:
                        print("Something error when navigation view")
                }
            default:
                print("Something error when get section view")
        }
    }
    
}

