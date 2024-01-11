//
//  SettingView.swift
//  voiceMemo
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack{
            TitleView()
            
            Spacer()
                .frame(height: 30)
            
            TotalCountView()
            
            Spacer()
                .frame(height: 30)
            
            TotalTabMoveView()
            
            Spacer()
            
        }
    }
}

private struct TitleView : View {
    var body: some View {
        HStack{
            Text("설정")
                .font(.system(size: 30,weight: .bold))
                .foregroundColor(.customBlack)
            
            Spacer()
        }
        .padding(.horizontal,30)
        .padding(.top,45)
        
    }
}

private struct TotalCountView : View {
    //    @ObservedObject private var TodoViewModel : TodoViewModel
    //    @ObservedObject private var memoViewModel : MemoViewModel
    //    @ObservedObject private var voiceRecorderViewModel : VoiceRecorderViewModel
    
    //    init(
    //        TodoViewModel: TodoViewModel,
    //        memoViewModel: MemoViewModel,
    //        voiceRecorderViewModel: VoiceRecorderViewModel) {
    //        self.TodoViewModel = TodoViewModel
    //        self.memoViewModel = memoViewModel
    //        self.voiceRecorderViewModel = voiceRecorderViewModel
    //    }
    
    var body: some View {
        HStack{
            
            
            TabCountView(title: "To do", count: 0)
            Spacer()
                .frame(width: 70)
            TabCountView(title: "메모", count: 0)
            Spacer()
                .frame(width: 70)
            TabCountView(title: "음성메모", count: 0)
        }
    }
}

private struct TabCountView : View {
    private var title : String
    private var count : Int
    
    init(
        title: String,
        count: Int) {
            self.title = title
            self.count = count
        }
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.customBlack)
            
            Text("\(count)")
                .font(.system(size: 30,weight: .medium))
                .foregroundColor(.customBlack)
        }
    }
}

private struct TotalTabMoveView : View {
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
            
            TabMoveView(
                title: "To do 리스트",
                tabAction: { }
            )
            
            TabMoveView(
                title: "메모",
                tabAction: { }
            )
            TabMoveView(
                title: "음성메모",
                tabAction: { }
            )
            TabMoveView(
                title: "타이머",
                tabAction: { }
            )
            
            
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
        }
    }
}

private struct TabMoveView : View {
    private var title : String
    private var tabAction : () -> Void
    
    init(
        title: String,
        tabAction: @escaping () -> Void) {
            self.title = title
            self.tabAction = tabAction
        }
    
    var body: some View {
        Button(
            action:
                tabAction,
            label: {
                HStack{
                    Text(title)
                        .font(.system(size: 14))
                        .foregroundColor(.customBlack)
                    
                    Spacer()
                    
                    Image("arrowRight")
                }
                
            }
        )
        .padding(.all,20)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
