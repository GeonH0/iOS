//
//  MyText.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/12.
//

import SwiftUI

struct MyText: View {
    var T : String
    var size : Font
    
    var body: some View {
        Text(T)
            .font(size)
            .padding()
    }
}

struct MyText_Previews: PreviewProvider {
    static var previews: some View {
        MyText(T:"TextElement1", size: .headline)
    }
}
