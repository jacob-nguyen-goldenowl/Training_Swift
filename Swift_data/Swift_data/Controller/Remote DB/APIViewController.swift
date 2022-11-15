//
//  APIViewController.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 07/11/2022.
//

import UIKit

class APIViewController: UIViewController {
    
    private let movies = MovieMO()
    
    private var trendingModel: [Movie] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableview.reloadData()
            }
        }
    }
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.register(APITableViewCell.self, forCellReuseIdentifier: APITableViewCell.indentifier)
        table.backgroundColor = .systemBackground
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if trendingModel.isEmpty {
            fetchData()
        }
    }
    
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        tableview.anchor( top: view.topAnchor,
                          bottom: view.bottomAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor)
    }
    
    private func fetchData() {
        let urlString = BaseURL.getURLWith()
        getTrendingMovieResponse(with: urlString)
    }
    
    private func getTrendingMovieResponse(with urlString: String) {
    
        APIClient<TrendingResponse>.fetch(with: urlString, method: .get) { result in
            switch result {
                case .success(let data):
                    self.trendingModel = data.results
                case .failure(let err):
                    print(err)
            }
        }
        
    }
    
    private func saveImage(url: String, completion: @escaping (UIImageView) -> Void ) {
        
        let imageView = UIImageView()
        
        guard let urlString = URL(string: "https://image.tmdb.org/t/p/w500\(url)") else {
            fatalError("Error when get link url")
        }
        
        URLSession.shared.dataTask(with: urlString) { data, _, error in
            
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
                completion(imageView)
            }
        
        }.resume()
        
    }
    
}

extension APIViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingModel.count 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: APITableViewCell.indentifier, for: indexPath) as? APITableViewCell else {
            fatalError("Some error when reusable cell")
        }
        
        cell.configCell(trendingModel[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
    
}

extension APIViewController: APITableViewCellDelegate {
    
    func handleDownloadMovie(_ data: APITableViewCell) {
                
        guard let indexPath = tableview.indexPath(for: data) else { return }
        let movie = trendingModel[indexPath.row]
        
        if let title = movie.original_title,
           let image = movie.poster,
           let date = movie.release_date
        {
            
            saveImage(url: image) { [self] img in
                
                    _ = movies.insertNewMovie(title: title, overview: movie.description, image: img, releaseDate: date)
                FirestoreManager.shared.writeDataToFirestore(title: title, description: movie.description, releaseDate: date, image: img, id: movie.id, nameImage: image)
            }
            
        }
        
    }
    
}
