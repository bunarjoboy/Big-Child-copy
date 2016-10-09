//
//  Alert.swift
//  Big Child
//
//  Created by Kevin Bunarjo on 9/28/16.
//  Copyright © 2016 Kevin Bunarjo. All rights reserved.
//

import Foundation

class Alert: Comparable, Equatable{
    
    fileprivate var time: DateComponents = DateComponents()
    fileprivate var messages: [[String]] = [["How are you doing today?", "Great!"], ["How's the weather looking?", "Great!"]]
    
    init(hour: Int, min: Int){
        self.time.hour = hour
        self.time.minute = min
    }
    init(date: Date){
        let calendar = NSCalendar.current
        let tempDC = calendar.dateComponents([.day, .month, .year, .hour, .minute], from: date)
        self.time.hour = tempDC.hour
        self.time.minute = tempDC.minute
    }
    
    func setHour(hour: Int){
        time.hour = hour
    }
    func setMinute(minute: Int){
        time.minute = minute
    }
    
    func getHour() -> Int{
        return time.hour!
    }
    func getMinute() -> Int{
        return time.minute!
    }
    
    func isMessageTime(current: Date) -> Bool{
        let calendar = NSCalendar.current
        let currentDateComponents = calendar.dateComponents([.day, .month, .year, .hour, .minute], from: current)
        let hourEqual = currentDateComponents.hour == time.hour
        let minuteEqual = currentDateComponents.minute == time.minute
        return hourEqual && minuteEqual
    }
    
    func createMessage() -> [String]{
        let random_num = Int(arc4random_uniform(UInt32(messages.count)))
        return messages[random_num]
    }
    
}

func ==(lhs: Alert, rhs: Alert) -> Bool{
    return lhs.getHour() == rhs.getHour() && lhs.getMinute() == rhs.getMinute()
}

func <(lhs: Alert, rhs: Alert) -> Bool{
    if lhs.getHour() == rhs.getHour(){
        return lhs.getMinute() < rhs.getMinute()
    }
    return lhs.getHour() < rhs.getHour()
}
