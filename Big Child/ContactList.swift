//
//  ContactList.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/25/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import Foundation

class ContactList{
    fileprivate var list: [Contact]
    fileprivate var isEmergency: Bool
    
    init(_ isEmergency: Bool){
        if isEmergency{
            list = [Contact(), Contact(), Contact()]
        } else {
            list = []
        }
        self.isEmergency = isEmergency
    }
    
    // normal contact list add
    func addContact(_ new: Contact){
        if !hasContact(new.getName()){
            if list.count == 1{
                if new < list[0]{
                    list.insert(new, at: 0)
                } else {
                    list.append(new)
                }
            }
            else {
                var index = 0
                var isAtEnd = true
                while index < list.count{
                    if new < list[index]{
                        list.insert(new, at: index)
                        isAtEnd = false
                        index = list.count
                    }
                    index += 1
                }
                if isAtEnd{
                    list.append(new)
                }
            }
        }
    }
    
    // emergency contact list add
    func addContact(_ new: Contact, _ position: Int){
        list.remove(at: position)
        list.insert(new, at: position)
    }
    
    func hasContact(_ name: String) -> Bool{
        for var con in list{
            if con.getName() == name{
                return true
            }
        }
        return false
       
    }
    
    func hasContact(_ num: Int) -> Bool{
        if num < list.count && num >= 0{
            return true
        }
        return false
    }
    
    // If know the name
    func getContact(_ name: String) -> Contact{
        for  var con in list{
            if con.getName() == name{
                return con
            }
        }
        return Contact()
    }
    /**
    func removeContact(_ name: String){
        var index = 0
        while index < getLength(){
            let con = list[index]
            if con.getName() == name{
                list.remove(at: index)
            }
            index += 1
        }
    }*/
    
    // If know the index
    func getContact(_ num: Int) -> Contact{
        if num < list.count  && num >= 0{
            return list[num]
        }
        return Contact()
    }
    
    func removeContact(_ num: Int){
        list.remove(at: num)
    }
    
    func getLength() -> Int{
        return list.count
    }
}
