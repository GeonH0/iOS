//
//  TodoView.swift
//  voiceMemo
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject private var pathModel : PathModel
    @EnvironmentObject private var todoListViewModel : TodoListViewModel
    @StateObject private var todoVIewModel = TodoViewModel()
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                leftBtnAction: {
                    pathModel.paths.removeLast()
                    //제일 최상단의 view가 닫힌다.
                },
                rightBtnAction: {
                    todoListViewModel.addTodo(
                        .init(
                            title: todoVIewModel.title,
                            time: todoVIewModel.time,
                            day: todoVIewModel.day,
                            seleted: false
                        )
                    )
                    pathModel.paths.removeLast()
                },
                rightBtnType: .create
            )
            // title view
            TitleView()
                .padding(.top,20)
            Spacer()
                .frame(height: 20)
            //todo title view
            todoTitleView(todoViewModel:todoVIewModel)
                .padding(.leading,20)
            // select time
            SelectTimeView(todoViewModel: todoVIewModel)
                .padding(.leading,20)
            // select date
            SelectDayView(todoViewModel: todoVIewModel)
                .padding(.leading,20)
            Spacer()
        }
    }
}

// MARK: - title View
private struct TitleView : View {
    var body: some View {
        HStack{
            
            
            Text("To do list를 \n 추가해 보세요")
            
            Spacer()
        }
        .font(.system(size: 30,weight: .bold))
        .padding(.leading,20)
    }
    
}

// MARK: - Todo TitleView
private struct todoTitleView : View {
    @ObservedObject private var todoViewModel : TodoViewModel
    
    init(todoViewModel: TodoViewModel) {
        self.todoViewModel = todoViewModel
    }
    var body: some View {
        TextField("제목을 입력하세요.", text: $todoViewModel.title)
    }
}
// MARK: - TimeSelect
private struct SelectTimeView : View {
    @ObservedObject private var todoViewModel : TodoViewModel
    init(todoViewModel: TodoViewModel) {
        self.todoViewModel = todoViewModel
    }
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
            DatePicker(
                "",
                selection: $todoViewModel.time,
                displayedComponents: [.hourAndMinute]
            )
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
            .frame(maxWidth: .infinity,alignment: .center)
            
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
        }
    }
}


// MARK: - select day
private struct SelectDayView: View {
    @ObservedObject private var todoViewModel : TodoViewModel
    
    init(todoViewModel: TodoViewModel) {
        self.todoViewModel = todoViewModel
    }
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Text("날짜")
                    .foregroundColor(.customIconGray)
                
                Spacer()
            }
                        
            HStack{
                Button(
                    action: {todoViewModel.setIsDisplayCalendar(true)},
                    label: {
                        Text("\(todoViewModel.day.formattedDay)")
                            .font(.system(size: 18,weight: .medium))
                            .foregroundColor(.customGreen)
                    }
                ).popover(
                    isPresented: $todoViewModel.isDisplayCalendar){
                        DatePicker(
                            "",
                            selection: $todoViewModel.day,
                            displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding()
                        .onChange(of: todoViewModel.day) { _ in
                            todoViewModel.setIsDisplayCalendar(false)
                            //날짜가 선택될시 캘린더가 닫힌다.
                        }
                        
                        
                    }
                Spacer()
            }
            
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
        
    }
}
