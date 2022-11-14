//
//  UserDefaultViewController.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 07/11/2022.
//


/*
 LEARN
    - Lưu trữ dữ liệu đơn giản tồn tại trong suốt quá trình hoạt động.
    - Dữ liệu đơn giản như: Các kiểu dữ liệu trong swift or dữ liệu custom như Class, struct, dictionary....
    - Lưu trữ dưới dạng cặp key - value
    - Lưu vào trong bộ nhớ đệm của thiết bị. Khi ứng dụng khởi chạy thì nó sẽ khôi phục và tiếp tục sử dụng trong suốt quá trình hoạt động.
    - Tính bảo mật kém
 */

import UIKit

struct User: Codable {
    let name: String
    let age: Int
}

class UserDefaultViewController: UIViewController {
    
    let userdefault = UserDefaults.standard
    let nameUser: String = "Jacob"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        saveDataUser()
        mockData()
        readDataUser()
    }
    
    private func saveDataUser() {
        
        // Save string type
        userdefault.set(nameUser, forKey: "user.name")

        // Save int type
        userdefault.set(23, forKey: "user.age")
        
        // Save bool type
        let isPublic = true
        userdefault.set(isPublic, forKey: "user.status")
        
        // Save Array
        let hobby = ["Play game", "Read book", "Play soccer"]
        userdefault.set(hobby, forKey: "user.hobby")
        
        // Save Dictionay
        let setting: [String: Any] = ["background": true, "location": "VN", "language": "VN"]
        userdefault.set(setting, forKey: "user.setting")
        
    }
    
    private func readDataUser() {
        
        if let userName = userdefault.string(forKey: "user.name") {
            print("Name of user is: ",userName)
        }
        let userAge = userdefault.integer(forKey: "user.age") 
        print("Age of user is: ",userAge)
        
        let userCheck = userdefault.bool(forKey: "user.status") 
        print("Check status: \(userCheck)")
        print(userCheck)
        
        let userHobby = userdefault.array(forKey: "user.hobby") ?? []
        print("Hobby of user is: ", userHobby[1])
        
        let userSetting = userdefault.object(forKey: "user.setting") as? [String: Any] ?? [String: Any]()  
        for i in userSetting.keys {
            print(i)
        }
        
        let decoder = JSONDecoder()
        let data = userdefault.object(forKey: "user.info")
        if let result = try? decoder.decode(User.self, from: data as! Data) {
            print(result)
        }
        
        let library_path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        print("libray path \(library_path)")
        
    }
    
    private func mockData() {
        let user = User(name: "Jacob", age: 23)
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(user) {
            userdefault.set(data, forKey: "user.info")
        }
    }
    
}
