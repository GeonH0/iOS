//
//  AuthenticationViewModel.swift
//  LMessenger
//
//  Created by 김건호 on 10/13/24.
//

import Foundation

enum AuthenticationState {
    case unauthenticated
    case authenticated
}

class AuthenticationViewModel: ObservableObject {
    
    enum Action {
        case googleLogin
    }
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(action: Action) {
        switch action {
        case .googleLogin:
            return
            
        }
    }
}
