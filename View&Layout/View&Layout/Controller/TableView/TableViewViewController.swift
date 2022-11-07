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
    
    let sectionTitle: [String] = ["First","Second", "Third", "Four", "Five"]
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTableView()
        createHeaderView()
        configureNavigationBar()
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.anchor(top: view.topAnchor,
                         bottom: view.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor)
        tableView.showsVerticalScrollIndicator = false

    }
    
    private func createHeaderView() {
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        headerView.backgroundColor = .systemRed
        headerView.headerImageView.image = UIImage(named: "headerImage")
        tableView.tableHeaderView = headerView
    }
    
    private func configureNavigationBar() {
        
        let navBar = navigationController?.navigationBar
        let navItem = navigationController?.navigationItem
        navBar?.prefersLargeTitles = false
                
        navItem?.largeTitleDisplayMode = .never
        
        self.hidenTitleBackButton()
    }

}

extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError("Some error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .red
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
