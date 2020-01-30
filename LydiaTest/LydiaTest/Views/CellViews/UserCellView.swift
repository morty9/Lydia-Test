//
//  UserCellView.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class UserCellView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let thumbnail: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = Colors.darkWhite
//        return imageView
//    }()
    
    let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let nameLabel: ImageLabel = {
        let imageLabel = ImageLabel()
        imageLabel.icon.image = #imageLiteral(resourceName: "user-64")
        imageLabel.label.font = .some(.systemFont(ofSize: 15, weight: .medium))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()
    
    let emailLabel: ImageLabel = {
        let imageLabel = ImageLabel()
        imageLabel.icon.image = #imageLiteral(resourceName: "envelope-64")
        imageLabel.label.font = .some(.systemFont(ofSize: 15, weight: .thin))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()
    
    let cityLabel: ImageLabel = {
        let imageLabel = ImageLabel()
        imageLabel.icon.image = #imageLiteral(resourceName: "maps-and-flags-64")
        imageLabel.label.text = "City"
        imageLabel.label.font = .some(.systemFont(ofSize: 15, weight: .thin))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        setBackgroundView()
        
        //backgroundView.addSubview(thumbnail)
        backgroundView.addSubview(infoStackView)
    
        //setThumbnail()
        setInfoStackView()
    }
    
    private func setBackgroundView() {
        backgroundView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        backgroundView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        backgroundView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -5)
            .isActive = true
    }
    
//    private func setThumbnail() {
//        thumbnail
//            .heightAnchor
//            .constraint(equalTo: backgroundView.heightAnchor, constant: -70)
//            .isActive = true
//        thumbnail
//            .widthAnchor
//            .constraint(equalTo: thumbnail.heightAnchor, multiplier: 1.0/1.0)
//            .isActive = true
//        thumbnail
//            .leadingAnchor
//            .constraint(equalTo: backgroundView.leadingAnchor, constant: 16)
//            .isActive = true
//        thumbnail
//            .centerYAnchor
//            .constraint(equalTo: backgroundView.centerYAnchor)
//            .isActive = true
//    }
    
    private func setInfoStackView() {
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(emailLabel)
        infoStackView.addArrangedSubview(cityLabel)
        
        infoStackView
            .centerYAnchor
            .constraint(equalTo: backgroundView.centerYAnchor)
            .isActive = true
        infoStackView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 20)
            .isActive = true
        infoStackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -35)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
