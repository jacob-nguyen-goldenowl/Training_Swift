//
//  ScrollViewViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN 
 - A view that allows the scrolling and zooming of its contained views.
 
 */

import UIKit

class ScrollViewViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    
    private var imageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "headerImage")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = .systemBackground
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        imageView.anchor(top: scrollView.topAnchor, bottom: scrollView.bottomAnchor, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor)
    }

}

extension ScrollViewViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        return updateMinZoomScale(scrollView.bounds.size)
    }
    
    func updateMinZoomScale(_ size: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = size.width / imageSize.width
        let heightScale = size.height / imageSize.height
        
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        
        scrollView.zoomScale = minScale
    }
    
}
