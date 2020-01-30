//
//  Fetcher.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit

class Fetcher {
    
    static let shared = Fetcher()
    
    private let baseUrl = "https://randomuser.me/api/1.3/"
    
    /// Fecth data from the url given
    /// - Parameters:
    ///   - url: url where data has to be fetched
    ///   - completion: data returned
    func fetchUsers(number: Int, completion: @escaping (Result<[User]>)-> Void) {

        guard let url = URL(string: "\(baseUrl)?results=\(number)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data else {
                return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
            }

            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.iso8601Full)
                decoder.userInfo[CodingUserInfoKey.managedObjectContext!] = CoreDataStack.shared.persistentContainer.viewContext
            
                do {
                    let res = try decoder.decode(UserResult.self, from: data)
                    
                    guard let users = res.results else {
                        return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
                    }
                    
                    completion(.Success(users))
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            
        })

        task.resume()
    }
    
}

enum Result<T> {
    case Success(T)
    case Error(String)
}
