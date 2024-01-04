//
//  TodoListViewModel.swift
//  voiceMemo
//

import Foundation

class TodoListViewModel : ObservableObject {
    
    @Published var todos : [Todo]
    @Published var isEditTodoMode : Bool
    @Published var removeTodos : [Todo]
    @Published var isDisplayRemoveTodoAlert : Bool
    
    var removeTodosCoutnt : Int {
        return removeTodos.count
    }
    
    var navigationBarRightBtnMode : NavigationBtnType {
        isEditTodoMode ? .complete : .edit
    }
    
    init(
        todos: [Todo] = [],
        isEditTodoMode: Bool = false,
        removeTodos: [Todo] = [],
        isDisplayRemoveTodoAlert: Bool = false
    ) {
        self.todos = todos
        self.isEditTodoMode = isEditTodoMode
        self.removeTodos = removeTodos
        self.isDisplayRemoveTodoAlert = isDisplayRemoveTodoAlert
    }
    
}

extension TodoListViewModel {
    //Todo의 selected값을 toggle 시켜주는거
    
    func seletedBoxTapped(_ todo : Todo) {
        if let index = todos.firstIndex(where: {$0 == todo}){
            todos[index].seleted.toggle()
        }
    }
    
    func addTodo(_ todo : Todo){
        todos.append(todo)
    }
    
    func navigationRightBtnTapped() {
        if isEditTodoMode{
            if removeTodos.isEmpty {
                isEditTodoMode = false
            } else {
                setIsDisplayRemoveTodoAlert(true)
            }
            
        } else {
            isEditTodoMode = true
        }
    }
    
    // Alert을 불러주기 위한함수
    func setIsDisplayRemoveTodoAlert(_ isDisplay : Bool) {
        isDisplayRemoveTodoAlert = isDisplay
    }
    
    func todoRemoveSeletedBoxTapped(_ todo: Todo) {
        if let index = removeTodos.firstIndex(of: todo) {
            //index가 포함되어 있으면 remove
            removeTodos.remove(at: index)
        } else {
            //아니면 해당 todo를 append
            removeTodos.append(todo)
        }
    }
    
    func removeBtnTapped() {
        
        todos.removeAll() { todo in
            removeTodos.contains(todo)
            
        }
        removeTodos.removeAll()
        isEditTodoMode = false
    }
    
}
