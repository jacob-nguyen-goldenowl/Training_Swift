//
//  Constraint+Extension.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation
import UIKit

extension UIView {
        // MARK: - Constraint anchor 
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0.0,
                paddingBottom: CGFloat = 0.0,
                paddingLeading: CGFloat = 0.0,
                paddingTrailing: CGFloat = 0.0 ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
    }
    
        // MARK: - Set width + height
    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
        // MARK: - Set center
    func centerX(with view: UIView,
                 topAnchor: NSLayoutYAxisAnchor? = nil,
                 paddingTop: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(withView view: UIView,
                 leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat? = nil,
                 constraint: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constraint).isActive = true
    }  
    
        // MARK: - Set dimensions of width, height in UIView
    func setDimensions(height: CGFloat, width: CGFloat) { 
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
}
