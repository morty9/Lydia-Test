//
//  ListController.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    let navBarTitle: UILabel = {
        let label = UILabel()
        label.text = Strings.nav_bar_title_list_controller.localized
        label.font = .some(.systemFont(ofSize: 18, weight: .semibold))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.sectionIndexColor = .black
        tableView.register(UserCellController.self, forCellReuseIdentifier: "UserCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        addSubview(userTableView)
        setUserTableView()
    }
    
    private func setUserTableView() {
        userTableView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        userTableView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        userTableView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        userTableView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
