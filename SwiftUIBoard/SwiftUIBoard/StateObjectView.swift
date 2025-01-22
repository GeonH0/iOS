//
//  StateObjectView.swift
//  SwiftUIBoard
//
//  Created by 김건호 on 10/11/24.
//

import SwiftUI

struct StateObjectView: View {
    @StateObject var viewmodel : ViewModel = .init(value: 1)
    
    var body: some View {
        Button("\(viewmodel.value)"){
            viewmodel.value += 1
        }
    }
}

#Preview {
    StateObjectView()
}
