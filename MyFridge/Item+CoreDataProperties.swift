//
//  Item+CoreDataProperties.swift
//  MyFridge
//
//  Created by Nguyen Anh Thu on 01/03/16.
//  Copyright © 2016 NAT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var name: String
    @NSManaged var quantity: NSNumber?
    @NSManaged var unit: String?
    @NSManaged var icon: NSData?

}
