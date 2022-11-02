//
//  TableViewViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN
    - Dùng để hiển thị danh sách các list view
    - Hiển thị danh sách thành các row.
    - Được tạo bởi nhiều section, mỗi section chứa nhiều row.
    - Section là số chỉ mục trong table, row là chỉ mục trong section.
    - Mỗi section có thể có 1 section header or section footer
    - Table view có 2 style: plain và ground
        + Plain
            * Không có sự phân tách giữa các section, mọi thứ được hiện thị đều.
        + Group
            * Phân tách riêng biệt giữa các group section với nhau
    - Hoạt động:
        + Để hiển thị table view thì nó phải thêm các protocol. 
            * delegate -> truyền các sự kiện
            * datasource -> cung cấp dữ liệu, như: số row, title, height, cell cho việc hiển thị dữ liệu
    - Các cell được tái sử dụng lại khi scroll table view
 
 */

import UIKit

class TableViewViewController: UIViewController {
    
    var data = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
    }
    
}

extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let index = data[indexPath.row]
        cell.textLabel?.text = index
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Press with row index \(indexPath.row)")
    }
    
}
