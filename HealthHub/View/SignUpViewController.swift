//
//  SignUpViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 10.10.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextSignUp: UITextField!
    @IBOutlet weak var passwordTextSignUp: UITextField!
      

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addUserButton(_ sender: Any) {
        
        if emailTextSignUp.text != "" && passwordTextSignUp.text != "" {
            Auth.auth().createUser(withEmail: emailTextSignUp.text!, password: passwordTextSignUp.text!) { (authdata, error) in
                
                
                if error != nil {
                    
                    self.makeAlert(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toSignIn", sender: nil)
                }
                
                
            } 
                       
        }
        
        else {
            
            
            makeAlert(titleInput: "Hata", messageInput: "Email/Şifre?")
            
        }
        
        
    }
    
    func makeAlert(titleInput : String , messageInput:String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
