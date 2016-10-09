//
//  ContactsViewController.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/26/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import Foundation
import UIKit

open class ContactsViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var contactsTable: UITableView!
    
    
    @IBAction func backButton(_ sender: AnyObject) {
        dismiss(animated: false, completion: nil)
        contactsTable.reloadData() //Delete
        print(contacts.getContact(0).getName())
        print(contacts.getContact(1).getName())
    }
    
    @IBAction func addContact(_ sender: AnyObject) {
        let addContactsVC = self.storyboard?.instantiateViewController(withIdentifier: "addContact")
        self.present(addContactsVC!, animated: false, completion: nil)
    }
    
    //Table View
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return contacts.getLength()
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

        cell.textLabel?.text = contacts.getContact((indexPath as NSIndexPath).row).getName()
        //cell.detailTextLabel?.text = contacts.getContact(indexPath.row).getPhoneNumber()
        
        return cell
    }
    
    open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        print("YOOOO")
        if editingStyle == .delete{
            contacts.removeContact(indexPath.row)
            self.contactsTable.reloadData()
        }
    }
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
 
    
    override open func viewDidAppear(_ animated: Bool) {
        contactsTable.reloadData()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
