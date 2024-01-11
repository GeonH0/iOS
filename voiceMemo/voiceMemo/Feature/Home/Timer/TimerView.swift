//
//  TimerView.swift
//  voiceMemo
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel = TimerViewModel()
    
    var body: some View {
        if timerViewModel.isDisplaySetTimeView {
            // 타이머 설정 뷰
            setTimerView(timerViewModel: timerViewModel)
        } else {
            //타이머 작동 뷰
            TimerOperationView(timerViewModel: timerViewModel)
        }
    }
}

private struct setTimerView : View {
    @ObservedObject private var timerViewModel : TimerViewModel
    
    init(timerViewModel: TimerViewModel) {
        self.timerViewModel = timerViewModel
    }
    
    var body: some View {
        VStack{
            // title
            TitleView()
            Spacer()
                .frame(height: 50)
            //timer picker
            TimePickerView(timerViewModel: timerViewModel)
            Spacer()
                .frame(height: 30)
            //setting btn
            
            TimerCreateBtnView(timerViewModel: timerViewModel)
            Spacer()
            
        }
    }
}

private struct TitleView : View {
    var body: some View {
        HStack{
            Text("타이머")
                .font(.system(size: 30,weight: .bold))
                .foregroundColor(.customBlack)
            
            Spacer()
        }
        .padding(.horizontal,30)
        .padding(.top,30)
    }
}

private struct TimePickerView : View {
    @ObservedObject private var timerViewModel : TimerViewModel
    
    init(timerViewModel: TimerViewModel) {
        self.timerViewModel = timerViewModel
    }
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.customGray2)
                .frame(height: 1)
            
            HStack{
                Picker("Hour",selection: $timerViewModel.time.hours){
                    ForEach(0..<24){ hour in
                        Text("\(hour)시")
                    }
                }
                Picker("Minutes",selection: $timerViewModel.time.minutes){
                    ForEach(0..<60){ minutes in
                        Text("\(minutes)분")
                    }
                }
                
                Picker("Seconds",selection: $timerViewModel.time.seconds){
                    ForEach(0..<60){ seconds in
                        Text("\(seconds)초")
                    }
                }
            }
            .labelsHidden()
            .pickerStyle(.wheel)
            
            Rectangle()
                .fill(Color.customGray2)
                .frame(height: 1)
            
        }
    }
}

private struct TimerCreateBtnView :View {
    @ObservedObject private var timerViewModel : TimerViewModel
    
    init(timerViewModel: TimerViewModel) {
        self.timerViewModel = timerViewModel
    }
    
    var body: some View {
        Button(
            action: {
                timerViewModel.settingBtnTapped()
            },
            label: {
                Text("설정하기")
                    .font(.system(size: 18,weight: .bold))
                    .foregroundColor(.customGreen)
            })
    }
}

private struct TimerOperationView : View {
    @ObservedObject private var timerViewModel : TimerViewModel
    
    init(timerViewModel: TimerViewModel) {
        self.timerViewModel = timerViewModel
    }
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    Text("\(timerViewModel.timeRemaining.formattedTiemString)")
                        .font(.system(size: 28))
                        .foregroundColor(.customBlack)
                        .monospaced() // 각각 글자간의 일정한 폭을 유지
                    
                    HStack(alignment: .bottom){
                        Image(systemName: "bell.fill")
                        
                        Text("\(timerViewModel.time.convertedSeconds.formateedSettingTime)")
                            .font(.system(size: 16))
                            .foregroundColor(.customBlack)
                            .padding(.top,10)
                    }
                }
                
                Circle()
                    .stroke(Color.customOrange,lineWidth: 6)
                    .frame(width: 350)
            }
            Spacer()
                .frame(height: 10)
            
            HStack{
                Button(
                    action: {
                        timerViewModel.cancelBtnTapped()
                    },
                    label: {
                        Text("취소")
                            .font(.system(size: 16))
                            .foregroundColor(.customBlack)
                            .padding(.vertical,25)
                            .padding(.horizontal,22)
                            .background(
                                Circle()
                                    .fill(Color.customGray2.opacity(0.3))
                            )
                    }
                )
                Spacer()
                
                Button(
                    action: {
                        timerViewModel.pauseOrRestartBtnTapped()
                    },
                    label: {
                        Text(timerViewModel.isPaused ? "계속진행" : "일시정지")
                            .font(.system(size: 16))
                            .foregroundColor(.customBlack)
                            .padding(.vertical,25)
                            .padding(.horizontal,7)
                            .background(
                                Circle()
                                    .fill(Color(red: 1, green: 0.75, blue: 0.52).opacity(0.3))
                            )
                    }
                )

            }
            .padding(.horizontal,20)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
