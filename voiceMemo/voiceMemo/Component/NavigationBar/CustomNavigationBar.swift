//
//  CustomNavigationBar.swift
//  voiceMemo
//

import SwiftUI

struct CustomNavigationBar: View {
    let isDisplayLeftButn : Bool
    let isDisplayRigthBtn : Bool
    let leftBtnAction : () -> Void
    let rightBtnAction: () -> Void
    let rightBtnType : NavigationBtnType
    
    init(
        isDisplayLeftButn: Bool = true,
        isDisplayRigthBtn: Bool = true,
        leftBtnAction: @escaping () -> Void = {},
        rightBtnAction: @escaping () -> Void = {},
        rightBtnType: NavigationBtnType = .edit) {
            self.isDisplayLeftButn = isDisplayLeftButn
            self.isDisplayRigthBtn = isDisplayRigthBtn
            self.leftBtnAction = leftBtnAction
            self.rightBtnAction = rightBtnAction
            self.rightBtnType = rightBtnType
        }
    var body: some View {
        HStack{
            if isDisplayLeftButn {
                Button(
                    action: leftBtnAction,
                    label: { Image("leftArrow") }
                )
            }
            Spacer()
            
            if isDisplayRigthBtn {
                Button(
                    action: rightBtnAction,
                    label: {
                        if rightBtnType == .close {
                            Image("colse")
                        } else {
                            Text(rightBtnType.rawValue)
                                .foregroundColor(.customBlack)
                        }
                    }
                )
            }
        }
        .padding(.horizontal,20)
        .frame(height: 20)
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
