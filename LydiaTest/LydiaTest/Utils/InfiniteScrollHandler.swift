//
//  InfiniteScrollHandler.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 29/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class InfiniteScrollHandler {
    
    static var shared = InfiniteScrollHandler()
    
    weak var listController: ListController?
    
    let userDataProvider = UserDataProvider.shared
    let service = Fetcher()
    let numberToFetch = 10
    var users = [UserViewModel]()
    var isLoading = false
    
    func fetchUsers() {
        users = userDataProvider.users
        if users.count == 0 {
            fetchData()
        }
    }
    
    func fetchData() {
        isLoading = true
        service.fetchUsers(number: numberToFetch) { [weak self] (results) in
            self?.isLoading = false
            switch results {
            case .Success(let users):
                _ = self?.userDataProvider.saveData(users)
                self?.users.append(contentsOf: users.map { UserViewModel(user: $0) })
                self?.listController?.reloadTableView()
            case .Error(let message):
                print("error: \(message)")
            }
        }
    }
    
}
