//
//  EditViewController.swift
//  TodoList
//
//  Created by Yaqi Miao on 2016/10/22.
//  Copyright © 2016 Yaqi Miao. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    var task : TodoListItem?
    var delegate : EditViewDelegate?
    
    lazy var textField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        view.placeholder = "Task Title"
        
        return view
    }()
    
    lazy var button: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(EditViewController.buttonPressed), for: .touchDown)
        view.setTitle("Save Task", for: .normal)
        view.backgroundColor = UIColor.blue
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        textField.delegate = self
        view.addSubview(textField)
        view.addSubview(button)
        if let taskTitle = task?.title {
            textField.text = taskTitle
        }
        
        // actions
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.setNeedsUpdateConstraints()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Pass data
    
    
    
    // Helper
    func buttonPressed() {
        if task != nil {
            task?.title = textField.text
        } else {
            // todo
            task = TodoListItem()
            task?.title = textField.text
            delegate?.updateTodoListData(task: task!)
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func updateViewConstraints() {
        // Center Text Field Relative to Page View
        super.updateViewConstraints()
        NSLayoutConstraint(
            item: textField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        // Set Text Field Width to be 80% of the Width of the Page View
        NSLayoutConstraint(
            item: textField,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0)
            .isActive = true
        
        // Set Text Field Y Position 10% Down From the Top of the Page View
        NSLayoutConstraint(
            item: textField,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.1,
            constant: 0.0)
            .isActive = true
        
        // Center button in Page View
        NSLayoutConstraint(
            item: button,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        // Set Width to be 30% of the Page View Width
        NSLayoutConstraint(
            item: button,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.3,
            constant: 0.0)
            .isActive = true
        
        // Set Y Position Relative to Bottom of Page View
        NSLayoutConstraint(
            item: button,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.9,
            constant: 0.0)
            .isActive = true
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
