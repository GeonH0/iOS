//
//  LaunchScreenView.swift
//  EXAMPLE
//
//  Created by 김건호 on 1/23/24.
//

import SwiftUI

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image("book_exchange_icon") // 앱의 로고나 적절한 이미지를 사용하세요.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)

                Text("중고 책 교환 앱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
            }
        }
    }
}



#Preview {
    LaunchScreenView()
}
