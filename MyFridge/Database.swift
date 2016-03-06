//
//  Database.swift
//  MyFridge
//
//  Created by Nguyen Anh Thu on 01/03/16.
//  Copyright © 2016 NAT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Database {
    class func addItem (name: String, icon: UIImage?, quantity: Int, unit: String?, withExpiration: Bool, expiration: NSDate?, notify: Int) -> Item? {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Item",
            inManagedObjectContext:managedContext)
        let object = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        object.setValue(name, forKey: "name")
        if let _icon = icon {
            object.setValue(UIImageJPEGRepresentation(_icon, 1), forKey: "icon")
        }
        object.setValue(quantity, forKey: "quantity")
        object.setValue(unit, forKey: "unit")
        object.setValue(withExpiration, forKey: "withExpiration")
        object.setValue(expiration, forKey: "expiration")
        object.setValue(notify, forKey: "notify")
        
        do {
            try managedContext.save()
            return object as? Item
        } catch let error as NSError  {
            print("Could not add new item to DB: \(error), \(error.userInfo)")
        }
        return nil

    }
    
    class func getAvailableItems() -> [Item]?{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Item")
        let predicate = NSPredicate(format: "quantity == 0")
        fetchRequest.predicate = predicate
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            if let _results = results as? [Item] {
                return _results
            }
            
        } catch let error as NSError {
            print("Could not get items from DB \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
    class func getUnavailableItems() {
        
    }
}
