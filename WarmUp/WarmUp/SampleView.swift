//
//  SampleView.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/11.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        VStack{
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .padding()
            MyText(T: "Text Elements1", size: .headline)
            MyText(T: "Text Elements2", size: .subheadline)
            MyText(T: "Text Elements3", size: .body)
                        
            HStack{
                MyButton(buttonTitle: "Button 1", buttonColor: .blue)
                MyButton(buttonTitle: "Button 2", buttonColor: .green)

                
                    
                }
            Button(action: {}, label: {
                VStack{
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Complex Button")
                }
                .foregroundColor(.white)
                .padding()
                .background(.orange)
                .cornerRadius(10)
            })
            }
                
        }
    }




struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
