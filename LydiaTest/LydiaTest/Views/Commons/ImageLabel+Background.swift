//
//  ImageLabel+Background.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class ImageLabelWithBg: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageLabel: ImageLabel = {
        let imageLabel = ImageLabel()
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(imageLabel)
        setImageLabel()
    }
    
    private func setBackgroundView() {
        backgroundView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        backgroundView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        backgroundView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setImageLabel() {
        imageLabel
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor, constant: 10)
            .isActive = true
        imageLabel
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 16)
            .isActive = true
        imageLabel
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -16)
            .isActive = true
        imageLabel
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
