//
//  StackViewViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN 
 
    - Stack view là một nơi chứa các view theo các chiều horizontal or vertical.
    - Có thể tùy chỉnh cho việc tự động layout.
    - Căn chỉnh các thuộc tính: 
        + axis: Chiều của view được sắp xếp.
 
        + alignment: xác định bố cục phù hợp theo chiều dọc .
            * Fill: phía dưới bên trái.
            * top: phía trên bên phải.
            * center: ở giữa phía trên.
            * bottom: phía dưới bên trái.
            * firstBaseline: xắp xếp phía trên đường kẻ vị trí trung tâm phía trên.
            * lastBaseline: xắp xếp phía dưới đường kẻ vị trí trung tâm phía dưới.
 
        + distribution: xác định bố cục phù hợp với trục stack axis
            * Fill: mặc định khi bạn tạo UIStackView.
            * Fill equally: các subview sẽ được giãn ra với kích thướng bằng nhau.
            * Fill proportionally: đảm bảo các subview sẽ được giản ra với tỉ lệ bằng nhau khi layout co giãn.
            * Equal spacing: duy trì khoảng cách bằng nhau giữa các subview và không thay đổi kích thước của subview.
            * Equal centering: duy trì khoảng cách bằng nhau giữa các vị trí trung tâm các subview.

        + spacing: khoảng cách giữa các subviews
 
        -> Sẽ điều chỉnh khoảng cách tương ứng các đối tượng trong stackview

 */

import UIKit

class StackViewViewController: UIViewController {
    
    private var horStackView = UIStackView()
    private var verStackView = UIStackView()


    // Create first image view
    lazy var fi: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image1")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10.0
        iv.layer.borderWidth = 1.0
        return iv
    }()
    
    // Create second image view
    lazy var si: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image2")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10.0
        iv.layer.borderWidth = 1.0
        return iv
    }()
    
    // Create third image view
    lazy var ti: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image3")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10.0
        iv.layer.borderWidth = 1.0
        return iv
    }()
    
    // Create four image view
    lazy var foi: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image1")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10.0
        return iv
    }()
    
    // Create five image view
    lazy var fii: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image2")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10.0
        return iv
    }()
    
    // Create six image view
    lazy var sii: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image3")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10.0
        return iv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        horStackView = UIStackView(arrangedSubviews: [fi, si, ti])
        horStackView.axis = .horizontal
        horStackView.distribution = .equalSpacing
        
        view.addSubview(horStackView)
        
        verStackView = UIStackView(arrangedSubviews: [foi, fii, sii])
        verStackView.axis = .vertical
        verStackView.distribution = .equalSpacing 
        
        self.hidenTitleBackButton()

        view.addSubview(verStackView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        horStackView.translatesAutoresizingMaskIntoConstraints = false
        verStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // constaint horizontal
            horStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            horStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            horStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            horStackView.heightAnchor.constraint(equalToConstant: 100),
            
            // constaint vertical
            
            verStackView.topAnchor.constraint(equalTo: horStackView.bottomAnchor, constant: 50),
            verStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            verStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
        ])
        
        fi.translatesAutoresizingMaskIntoConstraints = false
        si.translatesAutoresizingMaskIntoConstraints = false
        ti.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fi.widthAnchor.constraint(equalToConstant: 100),
            fi.heightAnchor.constraint(equalToConstant: 100),

            si.widthAnchor.constraint(equalToConstant: 100),
            si.heightAnchor.constraint(equalToConstant: 100),
            
            ti.widthAnchor.constraint(equalToConstant: 100),
            ti.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        fii.translatesAutoresizingMaskIntoConstraints = false
        sii.translatesAutoresizingMaskIntoConstraints = false
        foi.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foi.widthAnchor.constraint(greaterThanOrEqualToConstant: verStackView.frame.size.width),
            foi.heightAnchor.constraint(equalToConstant: 150),
            
            fii.widthAnchor.constraint(greaterThanOrEqualToConstant: verStackView.frame.size.width),
            fii.heightAnchor.constraint(equalToConstant: 150),
            
            sii.widthAnchor.constraint(greaterThanOrEqualToConstant: verStackView.frame.size.width),
            sii.heightAnchor.constraint(equalToConstant: 150)
        ])

    }

}
