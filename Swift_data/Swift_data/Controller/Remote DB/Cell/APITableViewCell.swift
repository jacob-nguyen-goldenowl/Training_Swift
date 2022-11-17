//
//  APITableViewCell.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 08/11/2022.
//

protocol APITableViewCellDelegate {
    func handleDownloadMovie(currentIndex: IndexPath, isDownload: Bool)
}

import UIKit

class APITableViewCell: UITableViewCell {
    static let indentifier = "APITableViewCell"
    
    var delegate: APITableViewCellDelegate?
    
    var currentIndex: IndexPath?
    
    var isDownload: Bool = false
    
    lazy var imageViewTrending: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    lazy var labelTitleTrending: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)!
        lbl.numberOfLines = 2
        lbl.textColor = .systemRed
        lbl.font = font
        lbl.text = "Some leter test"
        return lbl
    }()
    
    lazy var labelrelaseDateTreding: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        let font = UIFont(name: "CourierNewPS-ItalicMT", size: 15)!
        lbl.font = font
        lbl.numberOfLines = 0
        lbl.text = "Some leter test"
        return lbl
        
    }()
    
    lazy var labelDescriptionTrending: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        let font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 17)!
        lbl.font = font
        lbl.numberOfLines = 5
        lbl.textAlignment = .justified
        return lbl
    }()
    
    private let downloadButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        btn.tintColor = .label
        btn.tintColor = .systemIndigo
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        handleButtonEvent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstrains()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewTrending.image = UIImage(named: "imageDefault")
        labelTitleTrending.text = ""
        labelrelaseDateTreding.text = "Relase data: None"
        labelDescriptionTrending.text = ""
    }
    
    private func setupLayout() {
        addSubview(imageViewTrending)
        addSubview(labelTitleTrending)
        addSubview(labelrelaseDateTreding)
        addSubview(labelDescriptionTrending)
        contentView.addSubview(downloadButton)
    }
    
    private func handleButtonEvent() {
        downloadButton.addTarget(self, action: #selector(didTapDownloadMovie(_:)), for: .touchUpInside)
    }
    
    @objc func didTapDownloadMovie(_ sender: Any?) {
        downloadButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        delegate?.handleDownloadMovie(currentIndex: currentIndex!, isDownload: true)
    }

    private func setupConstrains() {
        imageViewTrending.anchor( top: topAnchor, 
                                  bottom: bottomAnchor, 
                                  leading: leadingAnchor, 
                                  paddingTop: 5, 
                                  paddingBottom: 5,
                                  paddingLeft: 10) 
        
        imageViewTrending.setWidth(width: 150)
        
        labelTitleTrending.anchor( top: topAnchor,
                                   leading: imageViewTrending.trailingAnchor,
                                   trailing: trailingAnchor,
                                   paddingTop: 5,
                                   paddingBottom: 5,
                                   paddingLeft: 10,
                                   paddingRight: 60)
        labelTitleTrending.setHeight(height: 50)
        
        labelrelaseDateTreding.anchor( top: labelTitleTrending.bottomAnchor,
                                       bottom: labelDescriptionTrending.topAnchor,
                                       leading: imageViewTrending.trailingAnchor,
                                       trailing: trailingAnchor,
                                       paddingBottom: 5,
                                       paddingLeft: 10,
                                       paddingRight: 15)
        
    
        labelDescriptionTrending.anchor( top: labelrelaseDateTreding.bottomAnchor,
                                         leading: imageViewTrending.trailingAnchor,
                                         trailing: trailingAnchor,
                                         paddingTop: 5,
                                         paddingLeft: 10,
                                         paddingRight: 15)
        labelDescriptionTrending.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionTrending.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 5).isActive = true
        
        downloadButton.anchor(top: topAnchor,
                              trailing: trailingAnchor,
                              paddingTop: 5,
                              paddingLeft: 5,
                              paddingRight: 10)
        downloadButton.setHeight(height: 50)
        downloadButton.setWidth(width: 50)
        
    }
    
    public func configCell(_ data: Movie, isDownload: Bool) {
        self.isDownload = isDownload
        fetchImage(urlString: data.poster ?? "", imageView: imageViewTrending)
        labelTitleTrending.text = data.originalName ?? "No name"
        labelrelaseDateTreding.text = "Release date: \(String.formatedDate(string: data.releaseDate ?? "None"))"
        labelDescriptionTrending.text = data.description
        
        if isDownload {
            downloadButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        } else {
            downloadButton.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        }
        
    }
    
    private func fetchImage(urlString: String, imageView: UIImageView) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(urlString)") else {
            return
        }
        
        // run in background thread
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            // run in main thread
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                imageView.image = image
            }
            
        }
        task.resume()
    }
    
}

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let date = DateFormatter()
        date.dateFormat = "YYYY-MM-dd"
        return date
    }()
    
    static let displayFormatter: DateFormatter = {
        let date = DateFormatter()
        date.dateStyle = .medium
        return date
    }()
}

extension String {
    static func formatedDate(string: String) -> String {
        let range = string.firstIndex(of: "T") ?? string.endIndex
        let subString = string[..<range]
        guard let date = DateFormatter.dateFormatter.date(from: String(subString)) else { return string }
        return DateFormatter.displayFormatter.string(from: date)
    }
}
