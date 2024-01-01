//
//  ContentView.swift
//  SwiftUIBoard
//
//  Created by 김건호 on 11/29/23.
//

import SwiftUI



struct ContentView: View {
    var seletedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack{
                        Circle()
                            .fill(Color.green)
                            .frame(width: 200,height: 200)
                        Circle()
                            .fill(Color.red)
                            .frame(width: 150,height: 150)
                    }
                    Spacer()
                    Text("Intense")
                        .foregroundStyle(Color.white)
                    Text("DHARKAN")
                        .foregroundStyle(Color.white)
                    Text("Intensely")
                        .foregroundStyle(Color.white)
                    Text("11")
                        .foregroundStyle(Color.white)
                    Spacer()
                    
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("NESPRESSO").font(.headline).foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
