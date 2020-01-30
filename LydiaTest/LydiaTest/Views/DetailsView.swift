//
//  DetailsView.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailsView: UIView {
    
    let navBarTitle: UILabel = {
        let label = UILabel()
        label.text = Strings.nav_bar_title_details_controller.localized
        label.font = .some(.systemFont(ofSize: 18, weight: .semibold))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.backgroundColor = Colors.darkWhite
        sv.scrollsToTop = true
        sv.alwaysBounceHorizontal = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addBackground(color: .white)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "picture-gray")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let genderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 20, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Name"
        label.font = .some(.systemFont(ofSize: 20, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dob: ImageLabel = {
        let imageLabel = ImageLabel()
        imageLabel.icon.image = #imageLiteral(resourceName: "birthday-cake-colored")
        imageLabel.label.font = .some(.systemFont(ofSize: 17, weight: .light))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()
    
    let cityLabel: ImageLabel = {
        let imageLabel = ImageLabel()
        imageLabel.icon.image = #imageLiteral(resourceName: "maps-and-flags-64")
        imageLabel.label.font = .some(.systemFont(ofSize: 17, weight: .light))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()
    
    let emailLabel: ImageLabelWithBg = {
        let view = ImageLabelWithBg()
        view.imageLabel.icon.image = #imageLiteral(resourceName: "email")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let numberStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let cellLabel: ImageLabelWithBg = {
        let view = ImageLabelWithBg()
        view.imageLabel.icon.image = #imageLiteral(resourceName: "smartphone")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneLabel: ImageLabelWithBg = {
        let view = ImageLabelWithBg()
        view.imageLabel.icon.image = #imageLiteral(resourceName: "telephone")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let usernameLabel: ImageLabelWithBg = {
        let view = ImageLabelWithBg()
        view.imageLabel.icon.image = #imageLiteral(resourceName: "user-64")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordTextField: PasswordView = {
        let view = PasswordView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addressLabel: ImageLabelWithBg = {
        let view = ImageLabelWithBg()
        view.imageLabel.icon.image = #imageLiteral(resourceName: "house")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        addSubview(scrollView)
        setScrollView()
        scrollView.addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(mainStackView)
        backgroundView.addSubview(emailLabel)
        backgroundView.addSubview(numberStackView)
        backgroundView.addSubview(usernameLabel)
        backgroundView.addSubview(passwordTextField)
        backgroundView.addSubview(addressLabel)
        backgroundView.addSubview(mapView)
        
        setMainStackView()
        setUserImage()
        setMainDataStackView()
        setGenderStackView()
        setEmailLabel()
        setNumberStackView()
        setUsernameLabel()
        setPasswordTextField()
        setAddressLabel()
        setMapView()
    }
    
    private func setScrollView() {
        scrollView
            .centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
        scrollView
            .widthAnchor
            .constraint(equalTo: widthAnchor)
            .isActive = true
        scrollView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        scrollView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setBackgroundView() {
        backgroundView
            .centerXAnchor
            .constraint(equalTo: scrollView.centerXAnchor)
            .isActive = true
        backgroundView
            .widthAnchor
            .constraint(equalTo: scrollView.widthAnchor)
            .isActive = true
        backgroundView
            .topAnchor
            .constraint(equalTo: scrollView.topAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: scrollView.bottomAnchor)
            .isActive = true
    }
    
    private func setMainStackView() {
        mainStackView.addArrangedSubview(userImage)
        mainStackView.addArrangedSubview(mainDataStackView)
        
        mainStackView
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor, constant: 10)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        mainStackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
        mainStackView.sizeToFit()
        mainStackView.layoutIfNeeded()
    }
    
    private func setUserImage() {
        userImage
            .heightAnchor
            .constraint(equalTo: mainStackView.heightAnchor, constant: -60)
            .isActive = true
        userImage
            .widthAnchor
            .constraint(equalTo: userImage.heightAnchor, multiplier: 1.0/1.0)
            .isActive = true
        userImage
            .leadingAnchor
            .constraint(equalTo: mainStackView.leadingAnchor, constant: 20)
            .isActive = true
    }
    
    private func setMainDataStackView() {
        mainDataStackView.addArrangedSubview(genderStackView)
        mainDataStackView.addArrangedSubview(nameLabel)
        mainDataStackView.addArrangedSubview(dob)
        mainDataStackView.addArrangedSubview(cityLabel)
        
        mainDataStackView
            .trailingAnchor
            .constraint(equalTo: mainStackView.trailingAnchor, constant: -15)
            .isActive = true
    }
    
    private func setGenderStackView() {
        genderStackView.addArrangedSubview(titleLabel)
        genderStackView.addArrangedSubview(genderImage)
    }
    
    private func setEmailLabel() {
        emailLabel
            .topAnchor
            .constraint(equalTo: mainStackView.bottomAnchor, constant: 15)
            .isActive = true
        emailLabel
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        emailLabel
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
    }
    
    private func setNumberStackView() {
        numberStackView.addArrangedSubview(cellLabel)
        numberStackView.addArrangedSubview(phoneLabel)
        
        numberStackView
            .topAnchor
            .constraint(equalTo: emailLabel.bottomAnchor, constant: 15)
            .isActive = true
        numberStackView
            .leadingAnchor
            .constraint(equalTo: emailLabel.leadingAnchor)
            .isActive = true
        numberStackView
            .trailingAnchor
            .constraint(equalTo: emailLabel.trailingAnchor)
            .isActive = true
    }
    
    private func setUsernameLabel() {
        usernameLabel
            .topAnchor
            .constraint(equalTo: numberStackView.bottomAnchor, constant: 15)
            .isActive = true
        usernameLabel
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        usernameLabel
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
    }

    private func setPasswordTextField() {
        passwordTextField
            .topAnchor
            .constraint(equalTo: usernameLabel.bottomAnchor, constant: 15)
            .isActive = true
        passwordTextField
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        passwordTextField
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
    }
    
    private func setAddressLabel() {
        addressLabel
            .topAnchor
            .constraint(equalTo: passwordTextField.bottomAnchor, constant: 15)
            .isActive = true
        addressLabel
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        addressLabel
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
    }
    
    private func setMapView() {
        mapView
            .topAnchor
            .constraint(equalTo: addressLabel.bottomAnchor, constant: 10)
            .isActive = true
        mapView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        mapView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
        mapView
            .heightAnchor
            .constraint(equalToConstant: 150)
            .isActive = true
        mapView
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
