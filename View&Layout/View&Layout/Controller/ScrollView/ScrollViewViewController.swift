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
    private var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        scrollView = UIScrollView(frame: CGRect(x: 10, y: view.safeAreaInsets.top + 100, width: view.frame.size.width - 20, height: view.frame.size.height - 120))
        scrollView.backgroundColor = .systemCyan
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: 1000, height: 2300)
        
        imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: scrollView.frame.size.width - 20, height: 300))
        imageView.image = UIImage(named: "image")
        
        
        let firstButton = UIButton(frame: CGRect(x: 50, y: 1000, width: 300, height: 100))
        firstButton.backgroundColor = .systemPink
        
        let secondButton = UIButton(frame: CGRect(x: 50, y: 2000, width: 300, height: 100))
        secondButton.backgroundColor = .systemRed
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstButton)
        scrollView.addSubview(secondButton)
        
        updateMinZoomScale(view.bounds.size)
        
    }

}

extension ScrollViewViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateMinZoomScale(view.bounds.size)
    }
    
    func updateMinZoomScale(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 4
        scrollView.zoomScale = minScale
    }
    
    
}
