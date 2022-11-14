//
//  KeychainViewController.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 07/11/2022.
//

/*
 LEARN 
    - Keychain là nơi lưu các dữ liệu nhạy cảm 
    - Các data sẽ ở trong encrypted database
    - Vì nó sign vào ứng dụng nên nếu bạn thay đổi bundle, id, profile thì sẽ không truy cập được chúng
    - Có 2 thành phần:
        + Data: dữ liệu cần lưu
        + Attribules: thành phần đính kèm 
    - Dữ liệu sẽ được mã hóa trước khi lưu trữ -> tạo đối tượng chứa dữ liệu đã mã hóa và attributes -> lưu trữ và Keychain
    - Keychain là 1 database -> có thể dùng các tác vụ cơ bản như CURD
    - 
 */

struct Account {
    let username: String
    let password: String
}

import UIKit
import Security

class KeychainViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var account = [Account]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
        setupNavigationBar()
        getItems()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNewItem() {
        
        let alert = UIAlertController(title: "Add", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter data"
            textField.returnKeyType = .next
        }
        alert.addTextField { textField in
            textField.placeholder = "Enter account"
            textField.returnKeyType = .next
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in 
            
            guard let textfields = alert.textFields, textfields.count == 2 else { return }
            let data = textfields[0]
            let account = textfields[1]
            
            guard let data = data.text, !data.isEmpty,
                  let account = account.text, !account.isEmpty
                  else {
                
                print("Add failure")
                return
            }

            self.addingItem(data: data, account: account)
            
        }))
        
        present(alert, animated: true)
        
    }
    
    private func addingItem(data: String, account: String) {
        
        let query = [
            kSecValueData: data.data(using: .utf8)!,
            kSecAttrAccount: account,
            kSecAttrServer: "GoldenOwl.vn",
            kSecClass: kSecClassInternetPassword,
            kSecReturnData: true,
            kSecReturnAttributes: true
        ] as CFDictionary
        
        var ref: AnyObject?
        
        // Add item 
        let status = SecItemAdd(query, &ref)
        
        _ = ref as! NSDictionary
        
        print("Status: \(status)")
        
        self.getItems()
    }
    
    private func getItems() {
        
        let query = [
            kSecAttrServer: "GoldenOwl.vn",
            kSecReturnAttributes: true,
            kSecReturnData: true,
            kSecClass: kSecClassInternetPassword,
            kSecMatchLimit: 20
        ] as CFDictionary
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(query, &result)
        
        print("Status: \(status)")
        
        let array = result as? [NSDictionary]
        
        array?.forEach { result in 
            
            let username = result[kSecAttrAccount] ?? ""
            let passwordData = result[kSecValueData] as! Data
            let password = String(data: passwordData, encoding: .utf8)!
            
            self.account.append(Account(username: username as! String, password: password))
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    private func deleteItem(ac: String) {
        let query = [
            kSecClass: kSecClassInternetPassword,
            kSecAttrServer: "GoldenOwl.vn",
            kSecAttrAccount: ac
        ] as CFDictionary
        
        SecItemDelete(query)
        self.getItems()
    }
    
}

extension KeychainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = account[indexPath.row].username
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {        
        if editingStyle == .delete {
            print("Delete success")
            let index = account[indexPath.row].username
            print(index)
            deleteItem(ac: index)
            account.remove(at: indexPath.row)
            getItems()
        } else if editingStyle == .insert {
            print("Insert")
        }
    }
    
}
