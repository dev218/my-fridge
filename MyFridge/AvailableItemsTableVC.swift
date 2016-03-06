//
//  AvailableItemsTableVC.swift
//  MyFridge
//
//  Created by Minh on 05.03.16.
//  Copyright © 2016 NAT. All rights reserved.
//

import Foundation
import UIKit

public class AvailableItemsTableVC : UITableViewController {
    var availableItems : [Item]?
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = availableItems {
            return items.count
        }
        return 0
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    }
}
