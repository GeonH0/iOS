//
//  MyButton.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/12.
//

import SwiftUI

struct MyButton: View {
    
    var buttonTitle : String
    var buttonColor : Color
    
    var body: some View {
        Button(action: {}, label: {Text(buttonTitle)
                .padding()
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(10)})
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(buttonTitle: "Button 4", buttonColor: .brown)
    }
}
