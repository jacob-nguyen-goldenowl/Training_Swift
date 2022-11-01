//
//  UILabelViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN 
 
    - A view that displays one or more lines of informational text.
    * Some text attributes: 
        + text: the label display
        + attribuleText: the style text that label display
        + font: The font of text
        + textColor: The color of text
        + textAlignment: aligming the text (.left, .right, .center)
        + lineBreakMode:wrapping and truncating the label’s text
        + numberOfLines: The maximum number of lines for rendering text
        + isHighlighted: A Boolean value that determines whether the label draws its text with a highlight
        + shadowColor: The shadow color of the text
        + shadowOffset: The shadow offset, in points, for the text
 
 */

import UIKit

class UILabelViewController: UIViewController {
    
    // Create first label
    lazy var fl: UILabel = {
        let lb = UILabel()
        lb.text = "A view that displays one or more lines of informational text. A view that displays one or more lines of informational text. A view that displays one or more lines of informational text"
        lb.textColor = .systemTeal
        lb.font = UIFont(name: "KohinoorGujarati-Bold", size: 20)
        lb.numberOfLines = 3
        return lb
    }()
    
    // Create second label
    lazy var sl: UILabel = {
        let lb = UILabel()
        lb.text = "A view that displays one or more lines of informational text. A view that displays one or more lines of informational text. A view that displays one or more lines of informational text"
        lb.textColor = .systemBlue
        lb.font = UIFont(name: "KohinoorGujarati-Bold", size: 18)
        lb.numberOfLines = 3
        lb.shadowOffset = CGSize(width: 4, height: 4)
        lb.shadowColor = .systemCyan
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(fl)
        view.addSubview(sl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        fl.translatesAutoresizingMaskIntoConstraints = false
        
        fl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        fl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        fl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        fl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        sl.translatesAutoresizingMaskIntoConstraints = false
        sl.topAnchor.constraint(equalTo: fl.bottomAnchor, constant: 20).isActive = true
        sl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        sl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        sl.heightAnchor.constraint(equalToConstant: 100).isActive = true

        
    }
    
}
