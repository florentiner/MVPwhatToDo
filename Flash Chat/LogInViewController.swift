//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
         if let e = error{print(e) }
        else {
            self!.performSegue(withIdentifier: "goToChat", sender: self)
          }
            }}

}
}
