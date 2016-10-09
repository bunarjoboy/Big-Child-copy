//
//  AddContactViewController.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/27/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import Foundation
import UIKit

open class AddContactViewController: UIViewController{
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBAction func doneButton(_ sender: AnyObject) {
        if firstNameText.text != "" && phoneNumberText.text != "" {
            let phone = phoneNumberText.text!
            let lName: String
            let email: String
            
            // check if lastNameText is nil
            if lastNameText.text == nil {
                lName = ""
            } else {
                lName = lastNameText.text!
            }
            
            // check if emailText is nil
            if emailText.text == nil {
                email = ""
            } else {
                email = emailText.text!
            }
            
            let con = Contact(firstName: firstNameText.text!, lastName: lName, phoneNumber: phone, email: email)
            contacts.addContact(con)
        }
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        dismiss(animated: false, completion: nil)
    }
    
    func clearField(){
        firstNameText.text = ""
        lastNameText.text = ""
        phoneNumberText.text = ""
        emailText.text = ""
    }
    
    // View Controller
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        clearField()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
