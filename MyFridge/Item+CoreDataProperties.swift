//
//  Item+CoreDataProperties.swift
//  MyFridge
//
//  Created by Minh on 05.03.16.
//  Copyright © 2016 NAT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
import UIKit

extension Item {

    @NSManaged var icon: NSData?
    @NSManaged var name: String
    @NSManaged var quantity: Int
    @NSManaged var unit: String?
    @NSManaged var expiration: NSDate?
    @NSManaged var notify: NSNumber?
    @NSManaged var withExpiration: Bool
    
    func iconImage() -> UIImage? {
        if let icondata = icon {
            return UIImage(data: icondata)
        }
        return nil
    }

}
