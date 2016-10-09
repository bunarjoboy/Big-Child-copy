//
//  AlertList.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/30/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import Foundation

class AlertList{
    fileprivate var list: [Alert]
    
    init(){
        list = []
    }
    
    func getLength() -> Int{
        return list.count
    }
    
    func getAlert(index: Int)->Alert{
        return list[index]
    }
    
    func addAlert(alert: Alert){
        if !hasAlert(alert: alert){
            if list.count == 1{
                if alert < list[0]{
                    list.insert(alert, at: 0)
                } else{
                    list.append(alert)
                }
            }
            else {
                var index = 0
                var isAtEnd = true
                while index < list.count{
                    if alert < list[index]{
                        list.insert(alert, at: index)
                        isAtEnd = false
                        index = list.count
                    }
                    index += 1
                }
                if isAtEnd{
                    list.append(alert)
                }
            }
        }
    }
    
    func removeAlert(alert: Alert){
        if hasAlert(alert: alert){
            var index = 0
            for var e in list{
                if e == alert{
                    list.remove(at: index)
                }
                index += 1
            }
        }
    }
    
    func removeAlert(num: Int){
        list.remove(at: num)
    }
    
    func hasAlert(alert: Alert) -> Bool{
        for e in list{
            if e == alert{
                return true
            }
        }
        return false
    }
    
}
