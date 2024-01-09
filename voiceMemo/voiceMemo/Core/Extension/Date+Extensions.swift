//
//  Date+Extensions.swift
//  voiceMemo
//

import Foundation

extension Date {
    var formattedTime : String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR") // 한국 시간
        formatter.dateFormat = "a hh:mm" //오전, 오후 시간
        return formatter.string(from: self)
    }
    
    var formattedDay : String {
        let now = Date() // 현재 시간
        let calendar = Calendar.current // 현재 캘린더
        
        let nowStartOfDay = calendar.startOfDay(for: now) //현재 부터 언제 날짜 인지
        let dateStartofDay = calendar.startOfDay(for: self) // 캘린더의 날자
        let numOfDaysDifference = calendar.dateComponents([.day], from: nowStartOfDay, to: dateStartofDay).day! // 서로 날이 얼마나 다른지 비교
        
        if numOfDaysDifference == 0 {
            return "오늘" // 비교한 값이 0 이면 오늘
        } else {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "M월 d일 E요일"
            return formatter.string(from: self)
            //아니면 한국 날 기준으로 retrun
        }
    }
    
    var formateedVoiceRecorderTime : String {
        let formatter  = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.M.d"
        return formatter.string(from: self)
    }
    
  
}
