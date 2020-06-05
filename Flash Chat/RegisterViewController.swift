//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

     if let email = emailTextfield.text, let password = passwordTextfield.text{
                
               Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error{print(e) }
                else {
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
                    }
                
                

                }
                
            }
            
            
        }
