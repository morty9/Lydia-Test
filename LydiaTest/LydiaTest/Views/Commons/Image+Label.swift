//
//  Image+Label.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class ImageLabel: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 15, weight: .thin))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        setStackView()
        
        setImageView()
    }
    
    private func setStackView() {
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(label)
        
        stackView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        stackView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        stackView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        stackView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setImageView() {
        icon
            .heightAnchor
            .constraint(equalToConstant: 28)
            .isActive = true
        icon
            .widthAnchor
            .constraint(equalTo: icon.heightAnchor)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
