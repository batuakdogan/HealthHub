//
//  ListBMIViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 29.10.2023.
//

import UIKit

class ListBMIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var bmiSaveViewModel = BMISaveViewModel()
    var bmiDataArray: [BMISaveModel] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

                tableView.dataSource = self
                tableView.delegate = self
                
                // Load BMI Values
                loadBMIValues()

    }
    
    func loadBMIValues() {
        
        bmiSaveViewModel.loadBMIValues { [weak self] (bmiDataArray, error) in
                    if let bmiDataArray = bmiDataArray {
                        self?.bmiDataArray = bmiDataArray
                        
                        // BMI Values saved, reload table
                        self?.tableView.reloadData()
                    } else if let error = error {
                        print("Hata: \(error.localizedDescription)")
                    }
                }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return bmiDataArray.count
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let bmiData = bmiDataArray[indexPath.row]
        cell.textLabel?.text = "BMI: \(bmiData.bmiValue)"
        cell.detailTextLabel?.text = "Tarih: \(bmiData.date)"
        return cell
        

    }
}
