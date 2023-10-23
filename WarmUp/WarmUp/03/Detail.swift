//
//  Detail.swift
//  WarmUp
//
//  Created by 김건호 on 10/23/23.
//

import SwiftUI

struct Detail: View {
    @Binding var showModal : Bool
    
    var body: some View {
        Text("모달페이지 입니다.2")
        Button {
            showModal = false
        } label : {
            Text("닫기")
        }
    }
}

#Preview {
    Detail(showModal: .constant(true))
}
