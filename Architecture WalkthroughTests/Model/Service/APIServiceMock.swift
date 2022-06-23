//
//  APIServiceMock.swift
//  Architecture WalkthroughTests
//
//  Created by Andrew Maher on 23/06/2022.
//

import Foundation
@testable import Architecture_Walkthrough

class APIServiceMock: APIServiceProtocol{
    
    
    func getAllTodos(_ completion: @escaping ([TodoEntity]?, Bool) -> Void) {
        let todos = [TodoEntity(userID: 1, id: 1, title: "Hello", completed: false)]
        completion(todos, false)
    }
}
