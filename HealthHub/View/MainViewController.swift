//
//  MainViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    

    
    @IBAction func goToIndexButton(_ sender: Any) {
        performSegue(withIdentifier: "toIndexSegue", sender: nil)
    }
    
}
