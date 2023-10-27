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
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        
    }
    
    
    
    

    
    @IBAction func goToIndexButton(_ sender: Any) {
        performSegue(withIdentifier: "toIndexSegue", sender: nil)
    }
    
    
    @IBAction func goToGymButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToGymSegue", sender: nil)
    }
    
    
    
    @IBAction func goToABoutButton(_ sender: Any) {
        
        
        performSegue(withIdentifier: "toAbout", sender: nil)
        
        
    }
    
    
    
    @IBAction func goTimer(_ sender: Any) {
        performSegue(withIdentifier: "toTimer", sender: nil)
    }
    
    
    
    
    
}
