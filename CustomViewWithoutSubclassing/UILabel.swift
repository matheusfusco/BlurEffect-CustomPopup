//
//  UILabel.swift
//  CustomViewWithoutSubclassing
//
//  Created by Matheus on 20/03/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, style: UIFont.TextStyle) {
        self.init()
        font = UIFont.preferredFont(forTextStyle: style)
        self.text = text
        textColor = UIColor(white: 0.1, alpha: 1.0)
        backgroundColor = .clear
    }
}
