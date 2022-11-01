//
//  CollectionViewViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN
    - Trình bày bố cục dưới dạng tùy chỉnh, ở dạng lưới
    - Cấu trúc:
        + Cell 
            * Thành phần các item trong collection view.
            * Datasource -> cung cấp thông tin cần thiết cho việc xây dựng collection và quản lý dữ liệu khi một item được thêm, xóa hoặc sắp xếp lại
            * Delegate -> quản lý việc config, lựa chọn item, sắp xếp, trang trí và các thay đổi.
        + Layout
            * Nhằm khai báo và sắp xếp và vị trí của tất cả cell, cũng như xây dựng view header or footer.
            * Thay đổi layout của collection bằng cách thay đổi thuộc tính collectionViewLayout, nó sẽ được cập nhật layout trực tiếp. 
 
 */

import UIKit

class CollectionViewViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
}

extension CollectionViewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeView = view.frame.size.width - 10
        return CGSize(width: sizeView / 3.5, height: (sizeView/3) * 5/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemIndigo
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader: 
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as! HeaderReusableView
                header.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
                header.backgroundColor = .systemGray
                header.configure(name: "Hello")
                return header
            default:
                fatalError("Unexpected element kind")
        }
        
    }
}


