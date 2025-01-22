//
//  LoginButtonStyle.swift
//  LMessenger
//
//  Created by 김건호 on 10/28/24.
//

import SwiftUI

struct LoginButtonStyle: ButtonStyle {
    
    let texColor: Color
    let borderColor: Color
    
    init(textColor: Color, borderColor: Color? = nil) {
        self.texColor = textColor
        self.borderColor = borderColor ?? textColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .foregroundColor(texColor)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(borderColor, lineWidth: 0.8)
            }
            .padding(.horizontal,15)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

