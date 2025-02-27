//
//  TimerViewModel.swift
//  voiceMemo
//

import Foundation
import UIKit

class TimerViewModel : ObservableObject {
    
    @Published var isDisplaySetTimeView : Bool
    @Published var time : Time
    @Published var timer : Timer?
    @Published var timeRemaining : Int
    @Published var isPaused : Bool
    var notificationService : NotificationService
    
    init(
        isDisplaySetTimeView: Bool = true,
        time: Time = .init(hours: 0, minutes: 0, seconds: 0),
        timer: Timer? = nil,
        timeRemaining: Int = 0,
        isPaused: Bool = false,
        notificationService : NotificationService = .init()
    ) {
        self.isDisplaySetTimeView = isDisplaySetTimeView
        self.time = time
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.isPaused = isPaused
        self.notificationService = notificationService
    }
    
  
}

extension TimerViewModel {
    
    func settingBtnTapped() {
        isDisplaySetTimeView = false
        timeRemaining = time.convertedSeconds
        //TODO: - 타이머 시작 메서드 호출
        startTimer()
        
        
    }
    
    func cancelBtnTapped() {
        // TODO: - 타이머 종료 메서드 호출
        stopTimer()
        isDisplaySetTimeView = true
        
    }
    
    func pauseOrRestartBtnTapped() {
        if isPaused {
            //TODO: - 타이머 시작 메서드
            startTimer()
        } else {
            timer?.invalidate()
            timer = nil
        }
        isPaused.toggle()
    }
    
    
}


private extension TimerViewModel {
    func startTimer() {
        guard timer == nil else { return }
        //백그라운드 상태에서도 적용하게
        
        var backgroundTaskID : UIBackgroundTaskIdentifier?
        backgroundTaskID = UIApplication.shared.beginBackgroundTask{ // 백그라운드 전환시 계속 수행할수 있게 함
            if let task = backgroundTaskID{
                UIApplication.shared.endBackgroundTask(task)
                backgroundTaskID = .invalid
            }
        }
        
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1, // 1초마다 변경
            repeats: true){ _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    //TODO: 타이머 종료 메서드
                    self.stopTimer()
                    self.notificationService.sendNotification()
                    if let task = backgroundTaskID{
                        UIApplication.shared.endBackgroundTask(task)
                        backgroundTaskID = .invalid
                    }
                }
                
            }
    }
    
    func stopTimer() {
        timer?.invalidate() // 타이머 무효화
        timer = nil
    }
}
