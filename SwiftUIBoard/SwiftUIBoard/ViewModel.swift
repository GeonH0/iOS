//
//  ViewModel.swift
//  SwiftUIBoard
//
//  Created by 김건호 on 10/11/24.
//

import Foundation

class ViewModel: ObservableObject {
    var value: Int{ didSet{ objectWillChange.send() } }
    
    var objectWillChange: ObservableObjectPublisher = .init()
    
    init(value: Int) {
        self.value = value
    }
}
