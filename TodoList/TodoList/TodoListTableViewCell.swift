//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by Yaqi Miao on 2016/10/21.
//  Copyright © 2016 Yaqi Miao. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    // Properties:
    
    let titleLabel = UILabel()
    let checkButton = UIButton()
    var task : TodoListItem?
    
    // Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.setBackgroundImage(#imageLiteral(resourceName: "redUnchecked"), for: .normal)
        checkButton.addTarget(self, action: #selector(TodoListTableViewCell.checkButtonTapped), for: .touchDown)
        contentView.addSubview(checkButton)
        contentView.addSubview(titleLabel)

        checkButtonConstraint()
        titleConstraint()
        
    }
    
    func titleConstraint() {
        titleLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 22).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    func checkButtonConstraint() {
        NSLayoutConstraint(item: checkButton, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 0.06, constant: 0.0).isActive = true
        checkButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }

    // Helper
    func checkButtonTapped() {
        print("checkButton was tapped.")
        if task != nil {
            task?.done = (task?.done)! ? false : true
            if (task?.done)! {
                checkButton.setBackgroundImage(#imageLiteral(resourceName: "redChecked"), for: .normal)
            } else {
                checkButton.setBackgroundImage(#imageLiteral(resourceName: "redUnchecked"), for: .normal)
            }
            
        }
        // update data structure
        // change image
    }

}
