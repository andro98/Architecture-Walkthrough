//
//  APIServiceProtocol.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 23/06/2022.
//

import Foundation

protocol APIServiceProtocol {
    func getAllTodos(_ completion: @escaping (_ todos: [TodoEntity]?, _ error: Bool) -> Void)
}
