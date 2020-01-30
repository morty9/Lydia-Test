//
//  UIStackView+Extension.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
