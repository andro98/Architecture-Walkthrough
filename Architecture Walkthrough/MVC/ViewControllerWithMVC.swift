//
//  ViewController.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 23/06/2022.
//

import UIKit

class ViewControllerWithMVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var todos: [TodoEntity] = []
    let apiService: APIServiceProtocol = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        setupTableView()
        emailTF.delegate = self
    }
    
    func todosCompletion(_ todos:[TodoEntity]?,_ error: Bool){
        DispatchQueue.main.async {
            [weak self] in
            guard let self = self else {return}
            self.activityIndicator.isHidden = true
            if error{
                self.errorLbl.isHidden = false
                self.errorLbl.text = "No Data"
            }else{
                self.todos = todos ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func didTapSubmit(_ sender: Any){
        activityIndicator.isHidden = false
        apiService.getAllTodos(todosCompletion(_:_:))
    }
}


extension ViewControllerWithMVC: UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        cell.configureCell(with: todos[indexPath.row])
        return cell
    }
}

extension ViewControllerWithMVC: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if(textField == emailTF){
            submitBtn.isEnabled = emailTF.text?.validateEmail() ?? false
        }
    }
}
