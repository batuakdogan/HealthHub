//
//  ViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 10.10.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailtextSignIn: UITextField!

    @IBOutlet weak var passwordTextSignIn: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func signInButton(_ sender: Any) {
        
        
        if emailtextSignIn.text != "" && passwordTextSignIn.text != "" {
            
            
            Auth.auth().signIn(withEmail: emailtextSignIn.text!, password: passwordTextSignIn.text!) { authdata, error in
                if error != nil {
                    
                    self.makeAlert(titleInput: "Hata", messageInput: "Email / Şifre Bulunamadı")
                    
                } else {
                    self.performSegue(withIdentifier: "toMainSegue", sender: nil)
                    
                }
            }
            
            
            
        } else {
            
            makeAlert(titleInput: "Hata", messageInput: "Email/Şifre?")
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signUpSegue", sender: nil)
        
    }
    
    
    func makeAlert(titleInput : String , messageInput:String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }

}

