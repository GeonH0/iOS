//
//  HomeViewModel.swift
//  voiceMemo
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var selectedTab : Tab
    @Published var todoCount : Int
    @Published var memosCount : Int
    @Published var voiceRecorderCount : Int
    
    init(
        selectedTab: Tab = .voiceRecorder,
        todoCount: Int = 0,
        memosCount: Int = 0 ,
        voiceRecorderCount: Int = 0
    ) {
        self.selectedTab = selectedTab
        self.todoCount = todoCount
        self.memosCount = memosCount
        self.voiceRecorderCount = voiceRecorderCount
    }
}

extension HomeViewModel {
    func setTodosCount(_ count : Int){
        todoCount = count
    }
    
    func setMemosCount (_ count : Int){
        memosCount = count
    }
    
    func setVoiceRecordersCount (_ count : Int){
        voiceRecorderCount = count
    }
    
    func changeSeletedTab(_ tab : Tab){
        selectedTab = tab
    }
}
