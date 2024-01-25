//
//  ContentView.swift
//  EXAMPLE
//
//  Created by 김건호 on 1/18/24.
//
import SwiftUI

struct ContentView: View {
    // 상단 탭을 위한 상태 변수
    @State private var selectedTopTab = 0
    
    // 하단 탭을 위한 상태 변수
    @State private var selectedBottomTab = 0
    
    var body: some View {
        
        
        // 하단 탭
        TabView(selection: $selectedBottomTab) {
            FirstTabView().tabItem {
                Label("홈", systemImage: "house")
            }.tag(0)
            Text("탐색").tabItem {
                Label("탐색", systemImage: "magnifyingglass")
            }.tag(1)
            Text("추가").tabItem {
                Label("추가", systemImage: "plus.circle")
            }.tag(2)
            Text("알림").tabItem {
                Label("알림", systemImage: "bell")
            }.tag(3)
            Text("설정").tabItem {
                Label("설정", systemImage: "gear")
            }.tag(4)
        }
        
    }
}

struct FirstTabView :View {
    var body: some View {
        Text("HELLO")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
