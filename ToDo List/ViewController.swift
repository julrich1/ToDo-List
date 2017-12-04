//
//  ViewController.swift
//  ToDo List
//
//  Created by Jacob Ulrich on 12/4/17.
//  Copyright © 2017 Jacob Ulrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var itemsList = [ToDoItem]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = itemsList[indexPath.row].title
        
        return cell
    }
    
    @IBAction func addItem(_ sender: Any) {
        let alertController = UIAlertController(title: "New Item", message: "Please enter a new item to add to your list", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in }))
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            guard let newItem = alertController.textFields?[0].text else {
                fatalError("Could not get text field value from alert")
            }
            
            if newItem.isEmpty {
                return
            }
            
            let item = ToDoItem(title: newItem)
            
            self.itemsList.append(item!)
            print(self.itemsList)
            let indexPath = IndexPath(row: self.itemsList.count - 1, section: 0)
            
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }))
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a task"
        }

        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

