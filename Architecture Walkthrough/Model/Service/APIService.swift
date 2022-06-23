//
//  APIService.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 23/06/2022.
//

import Foundation

class APIService: APIServiceProtocol{
    func getAllTodos(_ completion: @escaping ([TodoEntity]?, Bool) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos")!) { data, response, error in
            guard let data = data else{
                completion(nil, true)
                return
            }
            do{
                let todos = try JSONDecoder().decode([TodoEntity].self, from: data)
                completion(todos, false)
            }catch{
                completion(nil, true)
            }
        }.resume()
    }
}
