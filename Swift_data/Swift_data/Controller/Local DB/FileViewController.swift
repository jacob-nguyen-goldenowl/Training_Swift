//
//  FileViewController.swift
//  Swift_data
//
//  Created by Nguyễn Hữu Toàn on 07/11/2022.
//

import UIKit

class FileViewController: UIViewController {
    
    private lazy var buttonSavePDF: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("save PDF file", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imageDefault")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        buttonSavePDF.frame = CGRect( x: view.frame.size.width / 2 - 100,
                                      y: view.frame.size.height / 2 - 25,
                                      width: 200, height: 50 )
        buttonSavePDF.addTarget(self, action: #selector(didTapSaveFile), for: .touchUpInside)
        view.addSubview(buttonSavePDF)
        
        imageView.frame = CGRect( x: 0,
                                  y: 0,
                                  width: view.frame.size.width,
                                  height: view.frame.size.height / 2 - 50)
        view.addSubview(imageView)
    }
    
    @objc func didTapSaveFile() {
        
        guard let image = imageView.image?.pngData() else {
            print("No image found")
            return
        }   
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc, animated: true)

    }
}
