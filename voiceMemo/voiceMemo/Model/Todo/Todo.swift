//
//  Todo.swift
//  voiceMemo
//

import Foundation

struct Todo : Hashable {
    var title : String
    var time : Date
    var day : Date
    var seleted : Bool
    
    var convertedDateAndTime : String {
        // 오늘 - 오전 09:00에 알림
        String("\(day.formattedDay)-\(time.formattedTime)에 알림")
    }
}
