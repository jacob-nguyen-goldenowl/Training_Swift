//
//  TabbarViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 
 LEARN

    - Tạo ra các view hiển thị các chức năng riêng biệt
    - Dùng thiết kế những chức năng ngang hàng 
    - Di chuyển giữa các tab khác nhau là đang thay thế giao diện, không có hiệu ứng chuyển đổi.
    - Việc configure liên quan tới tabBarItem của view controller tương ứng với tab đó.
    - Vì mỗi viewcontroller là 1 array nên có thể cài đặt view gốc cho mỗi tab.
    - Mỗi tab là 1 root view + thêm array viewcontroller 
    
    * Custom bar 
        + Sử dụng tabBarItem để thêm title, hình ảnh cho item bar.
        + Xét tintColor cho item
        + Background image cho bar
        + Badge number: thông báo những thông tin chưa đọc
 
 */

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureColorTabBarItem()
        
        let homeVC = FirstViewController()
        let searchVC = SecondViewController()
        let profileVC = ThirdViewController()
        
        let navigationFirst = createTabBarController(view: homeVC, title: "First", titleTabBar: "Home", imageTabBar: "music.note.house", imageTabBarSelected: "music.note.house.fill")
    
        let navigationSecond = createTabBarController(view: searchVC, title: "Second", titleTabBar: "Search", imageTabBar: "magnifyingglass", imageTabBarSelected: "text.magnifyingglass")
        let navigationThird = createTabBarController(view: profileVC, title: "Third", titleTabBar: "Me", imageTabBar: "person", imageTabBarSelected: "person.fill")
        
        navigationSecond.tabBarItem.badgeValue = "10"
        navigationSecond.tabBarItem.badgeColor = .blue
        
        setViewControllers([navigationFirst, navigationSecond, navigationThird], animated: true)

    }
    
        // MARK: - Configure
    
    private func configureColorTabBarItem() {
        
        UITabBar.appearance().tintColor = .label
            // Make unselected icons white
        tabBar.unselectedItemTintColor = .red
        tabBar.backgroundColor = .systemBackground
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor(red:0.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha:0.2).cgColor
        tabBar.clipsToBounds = true
        
    }
    
        // MARK: - Create tab
    
    func createTabBarController(view: UIViewController, title: String, titleTabBar: String, imageTabBar: String, imageTabBarSelected: String? = nil ) -> UINavigationController {
        
        view.title = title
        view.navigationItem.largeTitleDisplayMode = .always
        
        let navigation = UINavigationController(rootViewController: view)
        navigation.navigationBar.tintColor = .label
        navigation.tabBarItem = UITabBarItem(title: titleTabBar , image: UIImage(systemName: imageTabBar ), selectedImage: UIImage(systemName: imageTabBarSelected ?? ""))
        
        navigation.navigationBar.prefersLargeTitles = true
        
        return navigation
        
    }
    
}
