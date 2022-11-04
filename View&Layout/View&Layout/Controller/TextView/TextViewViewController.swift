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
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document. When the user taps in an editable text view, that text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it’s up to you to make sure that doesn’t happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the first responder is at the bottom of the scrolling region, however, you may still need to resize or reposition the scroll view itself to ensure the first responder is visible."
        textView.font = UIFont(name: "HelveticaNeue", size: 20)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingBottom: 300)
    }
    

}
