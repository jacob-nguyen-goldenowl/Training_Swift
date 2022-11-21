//
//  Colors.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation
import UIKit

extension UIColor {
    static let color = colorTheme()
}

struct colorTheme {
    let primary = UIColor(named: "PrimaryColor")
    let secondary = UIColor(named: "SecondaryColor")
    let red = UIColor(named: "RedColor")
    let black = UIColor(named: "BlackColor")
    let gray = UIColor(named: "GrayColor")
    let violet = UIColor(named: "VioletColor")
}
