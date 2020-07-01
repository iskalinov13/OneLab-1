//
//  UIElements.swift
//  SnapKit Practice - 3
//
//  Created by Farukh Iskalinov on 28.06.20.
//  Copyright © 2020 Farukh Iskalinov. All rights reserved.
//

import Foundation
import UIKit

// тут можно было бы создать свой кастомный цвет и использовать его как-то так
//extension UIColor {
//    static let anyColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
//}

extension UIColor {
    static let appDarkGray = #colorLiteral(red: 0.3180910647, green: 0.3181500733, blue: 0.3180832863, alpha: 1)
    static let appGray = #colorLiteral(red: 0.6278695464, green: 0.6279774904, blue: 0.6278553009, alpha: 1)
    static let appOrange = #colorLiteral(red: 1, green: 0.5738176107, blue: 0.1097411588, alpha: 1)
}

extension UIButton {
    convenience init(backgroundColor: UIColor, titleColor: UIColor, title: String) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 12.0
        self.titleLabel?.font = .systemFont(ofSize: 30)
        self.clipsToBounds = true
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution) {
        self.init()
        self.axis = axis
        self.alignment = .fill
        self.distribution = distribution
        self.spacing = 10
    }
}
