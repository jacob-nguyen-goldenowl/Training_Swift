//
//  FireBaseViewController.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 07/11/2022.
//

import UIKit


class FireBaseViewController: UIViewController {
    
    private var movies: [MovieFirestore] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       // layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoreDataCollectionViewCell.self, forCellWithReuseIdentifier: CoreDataCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FireBaseCollectionViewCell.self, forCellWithReuseIdentifier: FireBaseCollectionViewCell.identifier)
        view.addSubview(collectionView)
        
        collectionView.anchor( top: view.safeAreaLayoutGuide.topAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               leading: view.leadingAnchor,
                               trailing: view.trailingAnchor)
        getDataFireStore()
    }
    
    private func getDataFireStore() {
        FirestoreManager.shared.readDataToFirestore()
        FirestoreManager.shared.completionHandlerGetMovie = { [weak self] movies in
            self?.movies = movies
        }
    }
    
}

extension FireBaseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (movies.count == 0) {
            self.collectionView.setEmptyMessage("Nothing to show :(")
        } else {
            self.collectionView.restore()
        }
        
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FireBaseCollectionViewCell.identifier, for: indexPath) as? FireBaseCollectionViewCell else {
            fatalError("Error when reusable cell")
        }
        
        let movie = movies[indexPath.row]
        cell.layer.cornerRadius = ((view.frame.size.width/3) - 10)/2
        cell.clipsToBounds = true
        cell.configData(image: movie.image)
        
        return cell
        
    }
    
}

extension FireBaseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = view.frame.size.width
        return CGSize(width: (collectionViewWidth/3) - 10, height: (collectionViewWidth/3) - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

