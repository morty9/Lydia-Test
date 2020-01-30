//
//  PasswordLabel.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class PasswordView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "privacy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = .some(.systemFont(ofSize: 15, weight: .thin))
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
//    let button: UIButton = {
//        let button = UIButton()
//        button.setImage(#imageLiteral(resourceName: "visibility"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(stackView)
        
        setStackView()
        setIconView()
        //setButton()
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
    
    private func setStackView() {
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(textField)
        //stackView.addArrangedSubview(button)
        
        stackView
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor, constant: 10)
            .isActive = true
        stackView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 16)
            .isActive = true
        stackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -16)
            .isActive = true
        stackView
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
            .isActive = true
    }
    
    private func setIconView() {
        icon
            .heightAnchor
            .constraint(equalToConstant: 28)
            .isActive = true
        icon
            .widthAnchor
            .constraint(equalTo: icon.heightAnchor)
            .isActive = true
        icon
            .leadingAnchor
            .constraint(equalTo: stackView.leadingAnchor)
            .isActive = true
    }
    
//    private func setButton() {
//        button
//            .heightAnchor
//            .constraint(equalToConstant: 30)
//            .isActive = true
//        button
//            .widthAnchor
//            .constraint(equalTo: button.heightAnchor)
//            .isActive = true
//        button
//            .leadingAnchor
//            .constraint(equalTo: stackView.trailingAnchor, constant: 5)
//            .isActive = true
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
