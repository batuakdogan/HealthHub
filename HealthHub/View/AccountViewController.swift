//
//  AccountViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 11.10.2023.
//

import UIKit
import Firebase
import FirebaseAuth
class AccountViewController: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(false, animated: false)
        if let user = Auth.auth().currentUser {
            let userEmail = user.email
            emailLabel.text = userEmail
        }
       
        
    }
    
    
    
    
    
    @IBAction func logOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSign", sender: nil)
        } catch {
            print("error")
        }
    }
    
    
    
    @IBAction func resetEmail(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: Auth.auth().currentUser?.email ?? "email") { (error) in
            if let error = error {
                // Şifre sıfırlama hatası
                print("Şifre sıfırlama hatası: \(error.localizedDescription)")
            } else {
                // Şifre sıfırlama e-postası gönderildi
                print("Şifre sıfırlama e-postası gönderildi.")
            }
        }
    }
    
    
    
    
}
