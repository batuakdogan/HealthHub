//
//  ToDoViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 30.10.2023.
//

import UIKit
import Firebase

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    let viewModel = ToDoViewModel()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoCell")

        tableView.dataSource = self
                tableView.delegate = self
                
                viewModel.loadToDoItems {
                    self.tableView.reloadData()
                }
        
        
    }
    

    
    @IBAction func addButtonTapped(_ sender: Any) {
        if let title = textField.text, !title.isEmpty {
                    viewModel.addItem(title: title)
                    textField.text = ""
                }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfItems()
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
            let item = viewModel.item(at: indexPath.row)
            cell.textLabel?.text = item.title
            cell.accessoryType = item.isCompleted ? .checkmark : .none
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            var item = viewModel.item(at: indexPath.row)
            item.isCompleted.toggle()
            viewModel.updateItem(item)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                viewModel.removeItem(at: indexPath.row)
            }
        }

}
