//
//  StartView.swift
//  EXAMPLE
//
//  Created by 김건호 on 1/25/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        HStack{
            Text("다 읽고 안보는 책 \n자리만 차지하는 책 \n다른책으로 교환하고 싶다면?")
            Button(
                action: {},
                label: {
                    Text("시작하기")
                        .font(.system(size: 18,weight: .medium))
                        
                }
            )
        }
    }
}



#Preview {
    StartView()
}
