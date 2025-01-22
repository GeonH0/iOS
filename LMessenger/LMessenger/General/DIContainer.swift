//
//  DIContainer.swift
//  LMessenger
//
//  Created by 김건호 on 10/11/24.
//

import Foundation

class DIContainer: ObservableObject {    
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
