//
//  Button.swift
//  EXAMPLE
//
//  Created by 김건호 on 1/25/24.
//

import SwiftUI

struct Button: View {
    var body: some View {
        Button(
            action:
                (),
            label: {
                HStack{
                    Text(title)
                        .font(.system(size: 14))
                        .foregroundColor(.customBlack)
                    
                    Spacer()
                    
                    Image("arrowRight")
                }
                
            }
        )
    }
}

#Preview {
    Button()
}
