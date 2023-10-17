//
//  SimpleView.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/11.
//

import SwiftUI
struct SimpleView : View {
    
    var body: some View {
        VStack{
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
            
            Text("헤드라인 입니다.")
                .font(.headline)
                .bold()
                .padding()
            
            
            Text("서브헤드라인 입니다.")
                .font(.subheadline)
                .padding()
            
            Text("바디 입니다.")
                .font(.body)
                .padding()
            Button(action: {}, label: {Text("Click Me")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .bold()
            })
        }
    }
}

struct SimpleView_Previews : PreviewProvider {
    static var previews: some View {
        SimpleView()
    }
}
