//
//  UNNotificationCenter.swift
//  localNotification
//
//  Created by 김건호 on 2023/06/23.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert){
        let content  = UNMutableNotificationContent()
        content.title = "물 마실 시간이에요"
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1
    }
}
