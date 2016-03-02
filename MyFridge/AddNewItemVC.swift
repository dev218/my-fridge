//
//  AddNewItemVC.swift
//  MyFridge
//
//  Created by Nguyen Anh Thu on 01/03/16.
//  Copyright © 2016 NAT. All rights reserved.
//

import Foundation
import UIKit

public class AddNewItemVC : UIViewController {
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var quantityTF: UITextField!
    @IBOutlet weak var unitTF: UITextField!

    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveItem(sender: AnyObject) {
        let name = itemNameTF.text!
        let quantity : Int
        if let quantityFromText = Int(quantityTF.text!) {
            quantity = quantityFromText
        } else {
            quantity = 0
        }
        Database.addItem(name, quantity: quantity, unit: unitTF.text)
    }
    
    @IBAction func itemNameChanged(sender: AnyObject) {
        updateSaveButton()
    }
    
    @IBAction func quantityChanged(sender: AnyObject) {
        updateSaveButton()
    }
    
    private func updateSaveButton() {
        if let name = itemNameTF.text where !name.isEmpty, let quantity = quantityTF.text where !quantity.isEmpty {
            saveBtn.enabled = true
        } else {
            saveBtn.enabled = false
        }
    }
    
    public override func viewDidLoad() {
        saveBtn.enabled = false
    }
}
