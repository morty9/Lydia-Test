//
//  DataManager.swift
//  Lydia
//
//  Created by Bérangère La Touche on 25/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UserDataProvider {

    static var shared = UserDataProvider()
    
    var users = [UserViewModel]()
    
    func fetchDataFromLocale() {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "email", ascending: true)]
        
        //var users = [UserViewModel]()
        do {
            users = try context.fetch(request).map { UserViewModel(user: $0) }
        } catch {
            print("Fetch failed")
        }
        
        //return users
    }
    
    func saveData(_ results: [User]) -> [UserViewModel] {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        
        let users = results.map {
            UserViewModel(user: $0)
        }
        
        if (context.hasChanges) {
            do {
                try context.save()
            } catch {
                print("Error while saving in core data")
            }
        }
        
        return users
    }
    
    func clearDataFromLocale(completion: () -> Void) {
        do {
            let context = CoreDataStack.shared.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            do {
                let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                _ = objects.map{$0.map{context.delete($0)}}
                CoreDataStack.shared.saveContext()
                completion()
            } catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }
 
}


