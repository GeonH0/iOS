//
//  Modal.swift
//  WarmUp
//
//  Created by 김건호 on 10/23/23.
//

import SwiftUI

struct Modal: View {
    
    @State var showModal : Bool  = false
    var body: some View {
        VStack{
            Text("메인 페이지 입니다.")
            Button {
                    showModal = true
            } label: {
                Text ("Modal 화면 전환")
            }
        }
        .sheet(isPresented: $showModal) {
            Detail(showModal: $showModal)
        }
    }
}

#Preview {
    Modal()
}
