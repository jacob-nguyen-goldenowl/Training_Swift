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
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor.init(red: 153/255, green: 39/255, blue: 219/255, alpha: 1.0) // Violet
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var gestureView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var labelGestureView: UILabel = {
        let label = UILabel()
        label.text = "Change color"
        label.textColor = .white
        label.textAlignment = .center
        let font = UIFont(name: "GillSans-Italic", size: 20)!
        label.font = font
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(yellowView)
        view.addSubview(gestureView)
        
        drawLine(start: CGPoint(x: 10, y: 250), end: CGPoint(x: 300, y: 350))
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        // 2. add the gesture recognizer to a view
        gestureView.addGestureRecognizer(tapGesture)
        
        // Add label in view
        gestureView.addSubview(labelGestureView)
        
    }
    
    // 3. this method is called when a tap is recognized
    @objc func handleTap(sender: UITapGestureRecognizer) {
        gestureView.backgroundColor = .systemPink
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // layout of red view
        redView.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 30, width: 100, height: 100)
        blueView.frame = CGRect(x: redView.frame.size.width + 20, y: redView.frame.origin.y , width: 100, height: 100)
        yellowView.frame = CGRect(x: redView.frame.size.width + blueView.frame.size.width + 30, y: blueView.frame.origin.y , width: 100, height: 100)
        yellowView.layer.cornerRadius = yellowView.frame.size.width/2
        
        gestureView.frame = CGRect(x: 30, y: 400, width: view.frame.size.width - 60, height: 50)
        
        labelGestureView.frame = gestureView.bounds
    }
    
    func drawLine(start: CGPoint, end: CGPoint) {
        
        // create PART
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        
        // create LAYER
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.purple.cgColor
        layer.lineWidth = 10
        layer.path = path.cgPath
        
        view.layer.addSublayer(layer)
    }
}


