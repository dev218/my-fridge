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
    @IBOutlet weak var expirationSwitch: UISwitch!
    @IBOutlet weak var expirationDatePicker: UIDatePicker!
    @IBOutlet weak var notifyTF: UITextField!
    @IBOutlet weak var decreaseNotify: UIButton!
    @IBOutlet weak var insreaseNotify: UIButton!
    @IBOutlet weak var expirationView: UIView!

    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveItem(sender: AnyObject) {
        if let quantityFromText = Int(quantityTF.text!), let notify = Int(notifyTF.text!) {
        
            if let _ = Database.addItem(itemNameTF.text!, icon: nil, quantity: quantityFromText, unit: unitTF.text, withExpiration: expirationSwitch.on, expiration: expirationDatePicker.date, notify: notify) {
                navigationController?.popViewControllerAnimated(true)
            }
            print("Cannot save item")
        } 
    }
    
    @IBAction func switchWithExpiration(sender: AnyObject) {
        expirationView.hidden = !expirationSwitch.on
    }
    
    @IBAction func decreaseNotifyTF(sender: AnyObject) {
        if let notifyText = notifyTF.text where !notifyText.isEmpty, let notify = Int(notifyText) {
            if (notify > 0) {
                notifyTF.text = String(notify - 1)
            } else {
                notifyTF.text = "0"
            }
        } else {
            notifyTF.text = "0"
        }
    }
    @IBAction func inscreaseNotifyTF(sender: AnyObject) {
        if let notifyText = notifyTF.text where !notifyText.isEmpty, let notify = Int(notifyText) {
            notifyTF.text = String(notify + 1)
        } else {
            notifyTF.text = "0"
        }
    }
    @IBAction func itemNameChanged(sender: AnyObject) {
        updateSaveButton()
    }
    
    @IBAction func quantityChanged(sender: AnyObject) {
        updateSaveButton()
    }
    
    private func updateSaveButton() {
        if let name = itemNameTF.text where !name.isEmpty, let quantity = quantityTF.text where !quantity.isEmpty, let _ = Int(quantity) {
            saveBtn.enabled = true
        } else {
            saveBtn.enabled = false
        }
    }
    
    private func enableExpirationPart(enable: Bool) {
        expirationDatePicker.enabled = enable
        notifyTF.enabled = enable
        insreaseNotify.enabled = enable
        decreaseNotify.enabled = enable
    }
    
    public override func viewDidLoad() {
        saveBtn.enabled = false
    }
}
