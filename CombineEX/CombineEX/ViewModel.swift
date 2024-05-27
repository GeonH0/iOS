//
//  ViewModel.swift
//  CombineEX
//
//  Created by 김건호 on 5/22/24.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    func updateMessage() {
        message.text = "Updated Message"
    }
}
