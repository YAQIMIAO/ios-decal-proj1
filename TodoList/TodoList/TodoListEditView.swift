//
//  TodoListEditView.swift
//  TodoList
//
//  Created by Yaqi Miao on 2016/10/22.
//  Copyright © 2016 Yaqi Miao. All rights reserved.
//

import UIKit

class TodoListEditView: UIView {
    
    lazy var textField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var submitButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(TodoListEditView.submitButtonPressed), for: .touchDown)
        view.setTitle("Press!", for: .normal)
        view.backgroundColor = UIColor.blue
        
        return view
    }()

    // Helper
    func submitButtonPressed() {
        print("submit button is pressed, input text is:")
        print(textField.text)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
