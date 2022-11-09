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

class FrameAndBoundViewController: UIViewController {
    
    lazy var mainView: UIView = {
        let vw = UIView()
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
        vw.layer.borderWidth = 2
        vw.layer.borderColor = UIColor.systemCyan.cgColor
      //  vw.backgroundColor = .systemCyan
        return vw
    }()
    
    private var redView: UIView = {
        let vw = UIView()
        vw.layer.borderWidth = 2
        vw.backgroundColor = .red
        vw.layer.borderColor = UIColor.systemRed.cgColor
        return vw
    }()
        
    // MARK: - Slider control
    
    private var frameXSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -200
        slider.maximumValue = 200
        return slider
    }()
    
    private var frameYSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -200
        slider.maximumValue = 200
        return slider
    }()
    
    
    // MARK: - Slider of cyan view
    private var frameXCyanSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -300
        slider.maximumValue = 300
        return slider
    }()
    
    private var frameYCyanSider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -300
        slider.maximumValue = 350
        return slider
    }()
    
    private var rotationSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = Float(CGFloat.pi/2)
        return slider
    }()
    
    // MARK: - Label view
    
    private var frameXLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Bound X of Cyan = 0"
        return lbl
    }()
    
    private var frameYLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Bound Y of Cyan = 0"
        return lbl
    }()
    
    private var frameWidthLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Frame X of Cyan = 100"
        return lbl
    }()
    
    private var frameHeightLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Frame Y of Cyan = 150"
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
    
        setupConstraintViews()
        setupNavigationBar()
        setupSubView()
    }
    
    private func setupNavigationBar() {
        self.hidenTitleBackButton()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func addTagertSlider() {
        frameXSider.addTarget(self, action: #selector(didTapChangeFrameXRedView(_:)), for: .valueChanged)
        frameYSider.addTarget(self, action: #selector(didTapChangeFrameYRedView(_:)), for: .valueChanged)
        frameXCyanSider.addTarget(self, action: #selector(didTapChangeFrameXCyanView(_:)), for: .valueChanged)
        frameYCyanSider.addTarget(self, action: #selector(didTapChangeFrameYCyanView(_:)), for: .valueChanged)
        rotationSlider.addTarget(self, action: #selector(didTapChangeRotation(_:)), for: .valueChanged)
    }
    
    private func setupConstraintViews() {  
        
        mainView.anchor( top: view.safeAreaLayoutGuide.topAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         paddingTop: 10,
                         paddingLeft: 10,
                         paddingRight: 10 )
        mainView.setHeight(height: 400)

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
    
    private func setupSubView() {
        
        cyanView.frame = CGRect(x: 100, y: 150, width: 100, height: 100)
        cyanView.addSubview(redView)
        redView.frame = CGRect(x: 2, y: 2, width: cyanView.frame.size.width - 2, height: cyanView.frame.size.height - 2)
        
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
                                 slider: frameXCyanSider,
                                 label: frameWidthLabel)
        
        configureStackHorizontal(view: frameHeightView,
                                 stack: frameHeightStackView,
                                 slider: frameYCyanSider,
                                 label: frameHeightLabel)
        
        configureStackHorizontal(view: rotationView,
                                 stack: rotationStackView,
                                 slider: rotationSlider,
                                 label: rotationLabel)
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
        
        frameXLabel.text = "Bound X Cyan = \(Int(frameXSider.value))"
        frameYLabel.text = "Bound Y Cyan = \(Int(frameYSider.value))"
        frameWidthLabel.text = "Frame X Cyan = \(Int(cyanView.frame.origin.x))"
        frameHeightLabel.text = "Frame Y Cyan = \(Int(cyanView.frame.origin.y))"
        rotationLabel.text = "Rotation = \(Int(rotationSlider.value * Float(CGFloat.pi * 2)))"
        
//        updateSlider()
        
    }
    
    private func updateSlider() {
        
        frameXSider.setValue(Float(redView.frame.origin.x), animated: true)
        frameYSider.setValue(Float(redView.frame.origin.y), animated: true)
        frameXCyanSider.setValue(Float(redView.frame.size.height), animated: true)
        frameYCyanSider.setValue(Float(redView.frame.size.width), animated: true)
        
    }

}

extension FrameAndBoundViewController {
    
    @objc func didTapChangeFrameXRedView(_ slider: UISlider) {
        cyanView.bounds.origin.x = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeFrameYRedView(_ slider: UISlider) {
        cyanView.bounds.origin.y = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeFrameXCyanView (_ slider: UISlider) {
        cyanView.frame.origin.x = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeFrameYCyanView (_ slider: UISlider) {
        cyanView.frame.origin.y = CGFloat(slider.value)
        updateTextLabel()
    }
    
    @objc func didTapChangeRotation(_ slider: UISlider) {
       redView.transform = CGAffineTransform(rotationAngle: CGFloat(slider.value))
       updateTextLabel()
    }
    
}


