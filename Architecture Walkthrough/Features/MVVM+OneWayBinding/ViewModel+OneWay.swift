//
//  ViewModel+OneWay.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 26/06/2022.
//

import Foundation

class ViewModelOneWay{
    weak var coordinator: MainCoordinator?
    
    private let apiService: APIServiceProtocol = APIService()
    private var todos: [TodoEntity] = []
    
    var isValidEmail: Observable<Bool> = Observable(false)
    var isInidicatorAvail: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var reloadTable: Observable<Bool> = Observable(false)
    
    var rowsCount: Int {
        return self.todos.count
    }
    
    func getTodoEntity(at index: IndexPath) -> TodoEntity{
        return todos[index.row]
    }
    
    func getAllTodos(){
        isInidicatorAvail.value = true
        apiService.getAllTodos {[weak self] todos, error in
            self?.isInidicatorAvail.value = false
            if error{
                self?.errorMessage.value = "No Data"
            }else{
                self?.todos = todos ?? []
                self?.reloadTable.value = true
            }
        }
    }
    
    func validateEmail(email: String?){
        isValidEmail.value = email?.validateEmail() ?? false
    }
}
