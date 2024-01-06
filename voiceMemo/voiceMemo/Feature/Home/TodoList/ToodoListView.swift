//
//  ToodoListView.swift
//  voiceMemo
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject private var pathModel : PathModel
    @EnvironmentObject private var todoListViewModel : TodoListViewModel
    
    var body: some View {
        
        ZStack{
            // TodoList Cell
            VStack {
                if !todoListViewModel.todos.isEmpty{
                    CustomNavigationBar(
                        isDisplayLeftButn: false,
                        rightBtnAction: {
                            todoListViewModel.navigationRightBtnTapped()
                        },
                        rightBtnType: todoListViewModel.navigationBarRightBtnMode
                    )
                } else {
                    Spacer()
                        .frame(height: 30)
                }
                TitleView()
                    .padding(.top,20)
                if todoListViewModel.todos.isEmpty {
                    AnnouncementView()
                } else {
                    TodoListContentView()
                        .padding(.top,20)
                }
                    
                
            }
            WriteTodoBtnView()
                .padding(.trailing,20)
                .padding(.bottom,50)
        }
        .alert(
            "To do List \(todoListViewModel.removeTodosCoutnt)개 삭제하시겠습니까?",
            isPresented: $todoListViewModel.isDisplayRemoveTodoAlert){
                Button("삭제", role: .destructive){
                    todoListViewModel.removeBtnTapped()
                }
                Button("취소",role: .cancel){}
            }
        
    }
}

// MARK: - TodoList 타이틀 view

private struct TitleView : View {
    @EnvironmentObject private var todoListViewModel : TodoListViewModel
    var body: some View {
        HStack{
            if todoListViewModel.todos.isEmpty{
                Text("To do List를\n추가해 보세요")
            } else {
                Text("To do List \(todoListViewModel.todos.count)개가 있습니다.")
            }
            Spacer()
        }
        .font(.system(size: 30,weight: .bold))
        .padding(.leading,20)
        
    }
}

// MARK: - TodoList 안내뷰
private struct AnnouncementView : View {
    var body: some View {
        VStack(spacing: 15){
            Spacer()
            Image("pencil")
                .renderingMode(.template)
            Text("\"매일 아침 5시 운동하자!\"")
            Text("\"매일 강의듣자!\"")
            Text("\"알고리즘 2문제씩 풀자!\"")
            Spacer()
        }
        .font(.system(size: 16))
        .foregroundColor(.customGray2)
    }
}

// MARK: - TodoList 컨텐츠 View
private struct TodoListContentView : View {
    @EnvironmentObject private var todoListViewModel : TodoListViewModel
    var body: some View {
        VStack{
            HStack{
                Text("할일목록")
                    .font(.system(size: 16,weight: .bold))
                    .padding(.leading,20)
                
                Spacer()
            }
            ScrollView(.vertical){
                VStack(spacing:0)
                {
                    Rectangle()
                        .fill(Color.customGray0)
                        .frame(height: 1)
                    
                    ForEach(todoListViewModel.todos, id: \.self){ todo in
                        // TODO: - Todo Cell view todo넣어서 view 호출
                        TodoCell(todo: todo)
                        
                    }
                }
            }
            
        }
    }
}

// MARK: - Todo Cell View
private struct TodoCell : View {
    @EnvironmentObject private var todoListViewModel : TodoListViewModel
    @State private var isRemoveSelected : Bool
    private var todo : Todo
    
    init(
        isRemoveSelected: Bool = false,
        todo: Todo) {
            
            _isRemoveSelected = State(initialValue: isRemoveSelected)
            self.todo = todo
        }
    
    var body: some View {
        VStack(spacing : 20){
            HStack{
                //편집 모드가 아닐경우
                if !todoListViewModel.isEditTodoMode {
                    Button(
                        action: {todoListViewModel.seletedBoxTapped(todo)}, label: {
                            todo.seleted ? Image("selectedBox") : Image("unSelectedBox") }
                    )
                }
                VStack(alignment: .leading,spacing: 5){
                    Text(todo.title)
                        .font(.system(size: 16))
                        .foregroundColor(todo.seleted ? .customIconGray : .customBlack)
                        .strikethrough(todo.seleted)
                    
                    Text(todo.convertedDateAndTime)
                        .font(.system(size: 15))
                        .foregroundColor(.customIconGray)
                }
                Spacer()
                
                if todoListViewModel.isEditTodoMode {
                    Button(
                        action: {
                            isRemoveSelected.toggle()
                            todoListViewModel.todoRemoveSeletedBoxTapped(todo)
                        },
                        label: {
                            isRemoveSelected ? Image("seleteBox") : Image("unSeletedBox") })
                }
            }
            .padding(.horizontal,20)
            .padding(.top,10)
            
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
        }
        
    }
}
// MARK: - Todo 작성 버튼 View
private struct WriteTodoBtnView : View {
    @EnvironmentObject private var pathModel : PathModel
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                Button(action: {
                    pathModel.paths.append(.todoView)
                }, label: {
                    Image("writeBtn")
                })
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
            .environmentObject(PathModel())
            .environmentObject(TodoListViewModel())
    }
}
