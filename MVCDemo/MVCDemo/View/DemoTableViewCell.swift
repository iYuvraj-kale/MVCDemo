//
//  DemoTableViewCell.swift
//  MVCDemo
//
//  Created by Yuvraj  Kale on 2/08/20.
//  Copyright © 2020 Yuvraj  Kale. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func showData(todo:Todomodel1){
        self.titleLbl.text = todo.title
        if(todo.completed!){
            self.statusLbl.text = "Completed"
            self.statusLbl.backgroundColor = .green
        }
        else{
            self.statusLbl.text = "Pending"
            self.statusLbl.backgroundColor = .systemYellow
        }
    }
}
