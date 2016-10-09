//
//  Contact.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/25/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import Foundation

class Contact: Comparable, Equatable {
    fileprivate var firstName: String
    fileprivate var lastName: String
    fileprivate var phoneNumber: String
    fileprivate var email: String
    
    init(firstName: String, lastName: String, phoneNumber: String, email: String){
        self.firstName = firstName.capitalized
        self.lastName = lastName.capitalized
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    init(){
        firstName = ""
        lastName = ""
        phoneNumber = ""
        email = ""
    }
    
    
    // Getters
    func getName() -> String{
        return firstName + " " + lastName
    }
    
    func getPhoneNumber() -> String{
        return phoneNumber
    }
    
    func getEmail() -> String{
        return email
    }
    
    //
    func isEmpty() -> Bool{
        return firstName == "" && phoneNumber == ""
    }
}

func ==(lhs: Contact, rhs: Contact) -> Bool{
    return lhs.firstName == rhs.firstName && lhs.phoneNumber == rhs.phoneNumber
}

func <(lhs: Contact, rhs: Contact) -> Bool{
    return lhs.firstName < rhs.firstName
}
