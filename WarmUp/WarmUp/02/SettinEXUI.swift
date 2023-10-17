//
//  SettinEXUI.swift
//  WarmUp
//
//  Created by 김건호 on 2023/10/17.
//

import SwiftUI

struct settingInfo : Hashable {
    let title : String
    let systemName : String
    let backgroundColor : Color
    let foregroundColor : Color
}

struct SettinEXUI: View {
    
    let data : [[settingInfo]] = [[settingInfo(title: "스크린타임", systemName: "hourglass", backgroundColor: .purple, foregroundColor: .white)],
                                [settingInfo(title: "설정", systemName: "gear", backgroundColor: .gray, foregroundColor: .white),
                                settingInfo(title: "손쉬운 사용", systemName: "person.crop.circle", backgroundColor: .blue, foregroundColor: .white)]
    ]
    var body: some View {
        NavigationStack{
            List{
                
                ForEach(data, id: \.self) { section in
                    Section{
                        ForEach( section, id: \.self) { item in
                            Label{
                                Text(item.title)
                            } icon : {
                                Image(systemName: item.systemName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.all,7)
                                    .background(item.backgroundColor)
                                    .foregroundColor(item.foregroundColor)
                                    .cornerRadius(6)
                                
                                
                            }
                        }
                    }
                    
                }
//                Section{
//                    Label{
//                        Text("스크린타임")
//                    } icon: {
//                        Image(systemName: "hourglass")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.all,7)
//                            .background(.purple)
//                            .foregroundColor(.white)
//                            .cornerRadius(6)
//                    }
//                }
//
//
//                Section{
//                    Label{
//                        Text("설정")
//                    } icon: {
//                        Image(systemName: "gear")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.all,7)
//                            .background(.gray)
//                            .foregroundColor(.white)
//                            .cornerRadius(6)
//                    }
//
//                    Label{
//                        Text("손쉬운 사용")
//                    } icon: {
//                        Image(systemName: "person.crop.circle")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .padding(.all,7)
//                            .background(.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(6)
//                    }
//
//                    Label{
//                        Text("개인정보보안 및 보안")
//                    } icon: {
//                        Image(systemName: "person.crop.circle")
//                    }
//                }
//
//                Label{
//                    Text("암호")
//                } icon: {
//                    Image(systemName: "key.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 20, height: 20)
//                        .padding(.all,7)
//                        .background(.purple)
//                        .foregroundColor(.white)
//                        .cornerRadius(6)
//                }
            }
            .navigationTitle("설정")
        }
    }
}

struct SettinEXUI_Previews: PreviewProvider {
    static var previews: some View {
        SettinEXUI()
    }
}
