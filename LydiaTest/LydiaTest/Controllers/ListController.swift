//
//  ListController.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListController: UITableViewController {
    
    let cellId = "UserCell"
    
    var infiniteScrollHandler = InfiniteScrollHandler.shared
    var userDataProvider = UserDataProvider.shared
    var coreDataStack = CoreDataStack.shared
    var isConnected = true
    
    let service = Fetcher()
    
    let listView: ListView = {
        let view = ListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var userImage = [UserImageViewModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tableView.register(UserCellController.self, forCellReuseIdentifier: cellId)
        isConnected = Reachability.isConnectedToNetwork()
        infiniteScrollHandler.listController = self
        infiniteScrollHandler.fetchUsers()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadSections(IndexSet(integer: .zero), with: .bottom)
        }
    }
    
    private func setTableViewDelegate() {
        listView.userTableView.delegate = self
        listView.userTableView.dataSource = self
    }
    
    private func setView() {
        navigationItem.titleView = listView.navBarTitle
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infiniteScrollHandler.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCellController
        
        let user = infiniteScrollHandler.users[indexPath.row]
        cell.updateCell(with: user, isConnected: isConnected)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        if infiniteScrollHandler.users.count-1 == indexPath.row && !infiniteScrollHandler.isLoading {
            if (isConnected) {
                infiniteScrollHandler.fetchData()
            } else {
                let alert = ErrorMessage().showError(msg: "You need connection to load more data")
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = DetailsController()
        detailsController.user = infiniteScrollHandler.users[indexPath.row]
        navigationController?.pushViewController(detailsController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}


