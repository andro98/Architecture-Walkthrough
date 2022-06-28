//
//  ViewControllerWithMVVM+TwoWayBinding.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 28/06/2022.
//

import UIKit

class ViewControllerWithMVVM_TwoWayBinding: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    let viewModel: ViewModelTwoWay = ViewModelTwoWay()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        bindViewsToModel()
        bindModelToView()
    }
    
    func bindViewsToModel(){
        emailTF.addTarget(viewModel, action: #selector(viewModel.validateEmail(email:)), for: .editingChanged)

    }
    
    func bindModelToView(){
        viewModel.isValidEmail.bind { [weak self] state in
            self?.submitBtn.isEnabled = state
        }
        
        viewModel.isInidicatorAvail.bind { [weak self] state in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = !state
            }
        }
        
        viewModel.errorMessage.bind { [weak self] msg in
            DispatchQueue.main.async {
                self?.errorLbl.text = msg ?? ""
                self?.errorLbl.isHidden = msg == nil
            }
        }
        
        viewModel.reloadTable.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func didTapSubmit(_ sender: Any){
        viewModel.getAllTodos()
    }
}


extension ViewControllerWithMVVM_TwoWayBinding: UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        cell.configureCell(with: viewModel.getTodoEntity(at: indexPath))
        return cell
    }
}
