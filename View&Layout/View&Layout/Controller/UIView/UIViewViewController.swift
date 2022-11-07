//
//  UIViewViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//


/*
 LEARN 
 - An object that manages the content for a rectangular area on the screen.
 - Defines the behaviors that are common to all views.
 - A view object renders content within its bounds rectangle, and handles any interactions with that content.
 // Some feature //
 + Drawing and animation
    - Draw content in their rectangular area using UIKit or Core Graphics.
 + Layout and subview management
    - Views may contain zero or more subviews.
    - Views can adjust the size and position of their subviews.
    - Use Auto Layout to define the rules for resizing and repositioning view.
  + Event handling
    - A view is a subclass of UIResponder and can respond to touches and other types of events.
    - Views can install gesture recognizers to handle common gestures.
 
 */

import UIKit

class UIViewViewController: UIViewController {
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "image2")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 20
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:))))
        return img
    }()
    
    lazy var cardView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.5)
        vw.isUserInteractionEnabled = false
        return vw
    }()
    
    lazy var triangleView: UIView = {
        let vw = UIView()
        vw.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureTriangle(_:))))
        return vw
    }()
    
    lazy var pentagonView: UIView = {
        let vw = UIView()
        vw.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesturePentagon(_:))))
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        setUpUI()
        createView()
        self.hidenTitleBackButton()
    }
    
    private func setUpUI() {
        view.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 200),
            imgView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpCardView()
    }

    private func setUpCardView() {
        imgView.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 200),
            cardView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func createView() {
        triangleView.frame =  CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        view.addSubview(triangleView)
        
        pentagonView.frame = CGRect(x: 0, y: view.frame.size.height / 1.5, width: view.frame.size.width, height: 300)
        view.addSubview(pentagonView)
        
        makeLayer(vw: triangleView,path: trianglePath())
        makeLayer(vw: pentagonView,path: pentagonPath())
    }
    
    private func makeLayer(vw: UIView, path: UIBezierPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
        vw.layer.addSublayer(shapeLayer)
        
    }
    
    func trianglePath() -> UIBezierPath {
        let path = UIBezierPath() 
        path.move(to: CGPoint(x: view.frame.size.width/2, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: view.frame.size.width - 100, y: 200))
        path.close()
        return path
    }
    
    func pentagonPath() -> UIBezierPath {
        let path = UIBezierPath()
            // Set the starting point of the shape.
        path.move(to: CGPoint(x: 100, y: 70))
        path.addLine(to: CGPoint(x: 200, y: 110))
        path.addLine(to: CGPoint(x: 160, y: 210))
        path.addLine(to: CGPoint(x: 40, y: 210))
        path.addLine(to: CGPoint(x: 0, y: 110))
        path.close()
        return path
    }
}

extension UIViewViewController {
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began {
                // code here ...
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            imgView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.imgView.transform = .identity
            })
        }

    }
    
    @objc func handlePanGestureTriangle(_ gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began {
                // code here ...
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            triangleView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.triangleView.transform = .identity
            })
        }
        
    }
    
    
    @objc func handlePanGesturePentagon(_ gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began {
                // code here ...
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            pentagonView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.pentagonView.transform = .identity
            })
        }
        
    }
}
