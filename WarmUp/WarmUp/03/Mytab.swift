//
//  Mytab.swift
//  WarmUp
//
//  Created by 김건호 on 10/24/23.
//

import SwiftUI

struct Mytab: View {
    @State var showModal : Bool  = false
    
    var body: some View {
        TabView {
            Onboarding()
                .background(.gray)
                .badge(6)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            
            Text("Received2")
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            
            Text("Received3")
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    
}

#Preview {
    Mytab()
}
