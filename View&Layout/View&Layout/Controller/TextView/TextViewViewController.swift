//
//  TextViewViewController.swift
//  View&Layout
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

/*
 LEARN
    - A scrollable, multiline text region.
 */

import UIKit

class TextViewViewController: UIViewController {
    
    // Create text view
    lazy var tv: UITextView = {
        let tview = UITextView()
        tview.text = "UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document. When the user taps in an editable text view, that text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it’s up to you to make sure that doesn’t happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the first responder is at the bottom of the scrolling region, however, you may still need to resize or reposition the scroll view itself to ensure the first responder is visible."
        tview.font = UIFont(name: "HelveticaNeue", size: 20)
        tview.translatesAutoresizingMaskIntoConstraints = false
        return tview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tv)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            tv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tv.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    

}
