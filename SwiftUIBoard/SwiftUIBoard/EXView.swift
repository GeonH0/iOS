//
//  EXView.swift
//  SwiftUIBoard
//
//  Created by 김건호 on 10/3/24.
//

import SwiftUI

struct EXView: View {
    @State var dsecription: String
    var body: some View {
//        ScrollView{
//            LazyVStack{
//                ForEach(1...100, id:\.self) { index in
//                    Text("\(index)")
//                    
//                }
//            }
//        }
        Button(dsecription) {
            dsecription = "여유롭다"
        }
    }
}

#Preview {
    EXView(dsecription: "안녕")
}
