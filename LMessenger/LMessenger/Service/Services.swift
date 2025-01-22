//
//  Services.swift
//  LMessenger
//
//  Created by 김건호 on 10/11/24.
//

import Foundation

protocol ServiceType {
    var authServices: AuthenticationServiceType { get set }
}

class Services: ServiceType {
    var authServices: AuthenticationServiceType
    
    init() {
        self.authServices = AuthenticationService()
    }
}

class StubService: ServiceType {
    var authServices: AuthenticationServiceType = StubAuthenticationServiceType()
}
