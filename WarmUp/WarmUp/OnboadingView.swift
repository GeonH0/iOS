//
//  OnboadingView.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/12.
//

import SwiftUI

struct OnboadingView: View {
    var body: some View {
        
        VStack{
            
            Text("What's New in Photos")
                .font(.system(size:35))
                .bold()
                .padding(20)
                .padding(.top,50)
            
            HStack{
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 4)
                    .foregroundColor(.blue)
                    
                
                VStack(alignment: .leading){
                    Text("Shared Libaray")
                        .font(.headline)
                    
                    Text("Combine photos and videos with the ")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
                
            }
            .padding(.vertical)
            HStack{
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 4)
                    .foregroundColor(.blue)
                    
                
                VStack(alignment: .leading){
                    Text("Copy & Paste Editsion")
                        .font(.headline)
                    
                    Text("Combine photos and videos with the ")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
                
            }
            .padding(.vertical)
            HStack{
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 4)
                    .foregroundColor(.blue)
                    
                
                VStack(alignment: .leading){
                    Text("Shared Libraray")
                        .font(.headline)
                    
                    Text("Combine photos and videos with the ")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
                
            }
            .padding(.vertical)
            
            
            Spacer()
            Button(action: {}, label: {Text("Continue")
                    .padding()
                    .frame(width: 350)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            })
            .padding(.bottom,60)
                

            
        }
        
        
    }
}

struct OnboadingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboadingView()
    }
}
