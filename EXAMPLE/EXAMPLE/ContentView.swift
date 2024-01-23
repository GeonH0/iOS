//
//  ContentView.swift
//  EXAMPLE
//
//  Created by 김건호 on 1/18/24.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                Text("구해요 탭의 콘텐츠")
                    .tabItem { Text("구해요") }
                    .tag(0)
                Text("바꿔요 탭의 콘텐츠")
                    .tabItem { Text("바꿔요") }
                    .tag(1)
                Text("추천 도서 탭의 콘텐츠")
                    .tabItem { Text("추천 도서") }
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            
            Picker("", selection: $selectedTab) {
                Text("구해요").tag(0)
                Text("바꿔요").tag(1)
                Text("추천 도서").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // 여기에 나머지 뷰 컨텐츠를 추가합니다.
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
