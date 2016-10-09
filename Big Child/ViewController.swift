//
//  ViewController.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/24/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import UIKit
import MessageUI

var contacts          = ContactList(false)
var missedAlerts      = 0
var isMiniSettingOpen = true

class ViewController: UIViewController,  UIPickerViewDelegate{
    
    @IBOutlet weak var noTasksLabel: UILabel!
    
    // Mini Settings
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var miniSettingsBackground: UIImageView!
    @IBOutlet weak var miniSettingsScroller: UIScrollView!
    @IBOutlet weak var advancedSettings: UIButton!
    @IBOutlet weak var alertsSwitch: UISwitch!
    
    // Contacts
    @IBOutlet weak var contact1: UITextField!
    @IBOutlet weak var contact1Pick: UIPickerView!
    @IBOutlet weak var contact2: UITextField!
    @IBOutlet weak var contact2Pick: UIPickerView!
    @IBOutlet weak var contact3: UITextField!
    @IBOutlet weak var contact3Pick: UIPickerView!
    
 
    func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    // Mini Settings Tab
    @IBAction func advancedSettingsPressed(_ sender: AnyObject) {
    }
    
    @IBAction func contactsEdit(_ sender: AnyObject) {
        let contactsVC = self.storyboard?.instantiateViewController(withIdentifier: "contacts")
        self.present(contactsVC!, animated: false, completion: nil)
    }
    
    @IBAction func closeMiniSettings(_ sender: AnyObject) {
        miniSettingsMove()
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: AnyObject) {
        miniSettingsMove()
    }
    
    func miniSettingsMove(){
        if isMiniSettingOpen{
            miniSettingsScroller.center.x   += 1000//248
            miniSettingsBackground.center.x += 1000//248
            isMiniSettingOpen = false
            
        } else {
            miniSettingsScroller.center.x   -= 1000//248
            miniSettingsBackground.center.x -= 1000//248
            isMiniSettingOpen = true
        }
    }
    
    // Emergency Contacts
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return contacts.getLength()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        self.view.endEditing(true)
        return contacts.getContact(row).getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        pickerView.isHidden = true
        let contact = contacts.getContact(row)
        if pickerView.tag == 10 {
            self.contact1.text = contact.getName()
        } else if pickerView.tag == 20 {
            self.contact2.text = contact.getName()
        } else if pickerView.tag == 30 {
            self.contact3.text = contact.getName()
        }
    }
    
    func textFieldDidBeginEditing(_ textField : UITextField){
        if textField.tag == 10 {
            self.contact1Pick.isHidden = false
            self.contact1Pick.reloadAllComponents()
        } else if textField.tag == 20 {
            self.contact2Pick.isHidden = false
            self.contact2Pick.reloadAllComponents() 
        } else if textField.tag == 30 {
            self.contact3Pick.isHidden = false
            self.contact3Pick.reloadAllComponents()
        }
        textField.endEditing(true)
    }
    
    // View Controller
    override func viewDidLoad() {

        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        miniSettingsMove()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

