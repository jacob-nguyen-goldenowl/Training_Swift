//
//  Frame&BoundViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN 
 - frame: The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
 - bounds: The bounds rectangle, which describes the view’s location and size in its own coordinate system.
 */

import UIKit

class Frame_BoundViewController: UIViewController {
    
    lazy var mainView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.borderWidth = 1
        return vw
    }()
    
    lazy var controlView: UIView = {
        let vw = UIView()
        vw.layer.borderWidth = 1
        return vw
    }()
    
    private var cyanView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .systemCyan
        return vw
    }()
    
    private var redView: UIView = {
        let vw = UIView()
        vw.layer.borderWidth = 2
        vw.layer.borderColor = UIColor.systemRed.cgColor
        return vw
    }()
        
    // MARK: - Slider control
    
    private var frameXSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        return slider
    }()
    
    private var frameYSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        return slider
    }()
    
    private var frameWidthSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        return slider
    }()
    
    private var frameHeightSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        return slider
    }()
    
    private var rotationSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        return slider
    }()
    
    // MARK: - Label view
    
    private var frameXLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Frame X = 0"
        return lbl
    }()
    
    private var frameYLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Frame Y = 0"
        return lbl
    }()
    
    private var frameWidthLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Frame width = 50"
        return lbl
    }()
    
    private var frameHeightLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Frame height = 50"
        return lbl
    }()
    
    private var rotationLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Rotation = 0"
        return lbl
    }()
    
    // MARK: - StackView
    private var verStackView = UIStackView()
    private var frameXStackView = UIStackView()
    private var frameYStackView = UIStackView()
    private var frameWidthStackView = UIStackView()
    private var frameHeightStackView = UIStackView()
    private var rotationStackView = UIStackView()

    
    // MARK: - UIView
    lazy var frameXView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    lazy var frameYView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    lazy var frameWidthView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    lazy var frameHeightView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    lazy var rotationView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        addTagertSlider()
    }
    
    private func setupViews() {
        
        view.addSubview(mainView)
        view.addSubview(controlView)
        
        mainView.addSubview(cyanView)
        cyanView.setAnchorPoint(CGPoint(x: 0.5, y: 0.5))
        mainView.addSubview(redView)
        
        setupConstraintViews()
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        self.hidenTitleBackButton()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func addTagertSlider() {
        frameXSider.addTarget(self, action: #selector(didTapChangeFrameX(_:)), for: .valueChanged)
        frameYSider.addTarget(self, action: #selector(didTapChangeFrameY(_:)), for: .valueChanged)
        frameWidthSider.addTarget(self, action: #selector(didTapChangeFrameWidth(_:)), for: .valueChanged)
        frameHeightSider.addTarget(self, action: #selector(didTapChangeFrameHeight(_:)), for: .valueChanged)
        rotationSlider.addTarget(self, action: #selector(didTapChangeRotation(_:)), for: .valueChanged)
    }
    
    private func setupConstraintViews() {  
        
        mainView.anchor( top: view.safeAreaLayoutGuide.topAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         paddingTop: 10,
                         paddingLeft: 10,
                         paddingRight: 10 )
        mainView.heightAnchor.constraint(equalToConstant: 400).isActive = true

        controlView.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            paddingBottom: 10,
                            paddingLeft: 10,
                            paddingRight: 10 )
        
        NSLayoutConstraint(item: mainView, attribute: .bottom, relatedBy: .equal, toItem: controlView, attribute: .top, multiplier: 1, constant: -20).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupControlStackViews()  
        configFrame()
    }
    
    private func setupControlStackViews() {
        
        controlView.addSubview(verStackView)
        configConstraintControlStackView()
        verStackView.axis = .vertical
        verStackView.distribution = .fillEqually
        verStackView.spacing = 20
        
        [frameXView, frameYView, frameWidthView, frameHeightView, rotationView].forEach {
            verStackView.addArrangedSubview($0)
        }
        
    }
    
    private func configConstraintControlStackView() {
        
        verStackView.anchor( top: controlView.topAnchor,
                             bottom: controlView.bottomAnchor,
                             leading: controlView.leadingAnchor,
                             trailing: controlView.trailingAnchor,
                             paddingTop: 10,
                             paddingBottom: 10,
                             paddingLeft: 10,
                             paddingRight: 10 )
        
    }
    
    private func configFrame() {

        configureStackHorizontal(view: frameXView,
                                 stack: frameXStackView,
                                 slider: frameXSider,
                                 label: frameXLabel)
        
        configureStackHorizontal(view: frameYView,
                                 stack: frameYStackView,
                                 slider: frameYSider,
                                 label: frameYLabel)
        
        configureStackHorizontal(view: frameWidthView,
                                 stack: frameWidthStackView,
                                 slider: frameWidthSider,
                                 label: frameWidthLabel)
        
        configureStackHorizontal(view: frameHeightView,
                                 stack: frameHeightStackView,
                                 slider: frameHeightSider,
                                 label: frameHeightLabel)
        
        configureStackHorizontal(view: rotationView,
                                 stack: rotationStackView,
                                 slider: rotationSlider,
                                 label: rotationLabel)
    
        redView.frame = CGRect( x: cyanView.frame.origin.x,
                                y: cyanView.frame.origin.y,
                                width: cyanView.frame.size.width,
                                height: cyanView.frame.size.height)
        
    }
    
    private func configureStackHorizontal(view: UIView ,stack: UIStackView, slider: UISlider, label: UILabel) {
        
        view.addSubview(stack)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.addArrangedSubview(slider)
        stack.addArrangedSubview(label)
        stack.anchor(top: view.topAnchor,
                     bottom: view.bottomAnchor,
                     leading: view.leadingAnchor,
                     trailing: view.trailingAnchor)
        
    }
    
    private func updateTextLabel() {
        
        frameXLabel.text = "Frame X = \(Int(cyanView.frame.origin.x))"
        frameYLabel.text = "Frame Y = \(Int(cyanView.frame.origin.y))"
        frameWidthLabel.text = "Frame width = \(Int(cyanView.frame.size.width))"
        frameHeightLabel.text = "Frame height = \(Int(cyanView.frame.size.height))"
        rotationLabel.text = "Rotation = \(Int(rotationSlider.value))"
        
        print("Bound x: \(cyanView.bounds.origin.x)")
        print("Bound y: \(cyanView.bounds.origin.y)")
        print("Bound with: \(cyanView.bounds.size.width)")
        print("Bound height: \(cyanView.bounds.size.height)")
    
    }

}

extension Frame_BoundViewController {
    
    @objc func didTapChangeFrameX(_ slider: UISlider) {
        cyanView.frame.origin.x = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeFrameY(_ slider: UISlider) {
        cyanView.frame.origin.y = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeFrameWidth(_ slider: UISlider) {
        cyanView.frame.size.width = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeFrameHeight(_ slider: UISlider) {
        cyanView.frame.size.height = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeRotation(_ slider: UISlider) {
        cyanView.transform = CGAffineTransform(rotationAngle: CGFloat(slider.value))
        updateTextLabel()
    }
    
}

extension UIView {
    
    func setAnchorPoint(_ point: CGPoint) {
        
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}
