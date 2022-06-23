//
//  TodoTableViewCell.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 23/06/2022.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureCell(with todo: TodoEntity){
        self.title.text = todo.title
    }
}
