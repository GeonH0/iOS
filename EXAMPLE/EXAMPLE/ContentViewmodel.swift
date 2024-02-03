//
//  ContentViewmodel.swift
//  EXAMPLE
//
//  Created by 김건호 on 2/1/24.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var selectedTab: Tab = .one
}
