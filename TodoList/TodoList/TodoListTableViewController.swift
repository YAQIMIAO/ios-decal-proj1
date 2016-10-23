//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by Yaqi Miao on 2016/10/21.
//  Copyright © 2016 Yaqi Miao. All rights reserved.
//

import UIKit

protocol EditViewDelegate {
    func updateTodoListData(task: TodoListItem)
}

class TodoListTableViewController: UITableViewController, EditViewDelegate {
    
    var todoTasks : [TodoListItem] = []
    var createTodoButton: UIBarButtonItem!
    let editSegueIdentifier = "ShowEditSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // UI
        createTodoButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(TodoListTableViewController.createTodoButtonPressed))
        navigationItem.rightBarButtonItem = createTodoButton
        title = "Todos"
        
        // setting intial data: populate to do list with some inital tasks
        let washClothes = TodoListItem()
        washClothes.title = "Wash clothes"
        let cleanHouse = TodoListItem()
        cleanHouse.title = "Clean the house"
        todoTasks.append(contentsOf: [washClothes, cleanHouse])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoTasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TodoListTableViewCell

        cell.task = todoTasks[indexPath.row]
        cell.titleLabel.text = todoTasks[indexPath.row].title
        
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todoTasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            print("Not yet implemented")
        }    
    }
    
    // Helper
    func createTodoButtonPressed() {
        print("User want to create new todo list item.")
        let nextViewController = EditViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // Pass data
    func updateTodoListData(task: TodoListItem) {
        self.todoTasks.append(task)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == editSegueIdentifier,
            let destination = segue.destination as? EditViewController,
            let cellIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.task = todoTasks[cellIndex]
            destination.delegate = self
        }
        
    }

}
