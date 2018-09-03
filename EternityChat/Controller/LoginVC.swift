//  LoginVC.swift
//  EternityChat
//
//  Created by Macbook on 7.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    private let MainSeque = "mainSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameLabel.alpha = 0
        //nameTextField.alpha = 0
        //signUp.isHidden = true
       
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthProvider.Instance.isLoggedIn() {
            self.performSegue(withIdentifier: self.MainSeque, sender: nil)
        }
    }
    
    
    @IBAction func IndexChanged(_ sender: Any) {
        switch segmentController.selectedSegmentIndex {
        case 0 :
            nameLabel.alpha = 0
            nameTextField.alpha = 0
            signUp.isHidden = true
            login.isHidden = false
            break
        case 1 :
            nameLabel.alpha = 1
            nameTextField.alpha = 1
            login.isHidden = true
            signUp.isHidden = false
            break
        default:
            break
        }
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        if AuthProvider.Instance.isLoggedIn() {
//            performSegue(withIdentifier: self.MainSeque, sender: nil)
//        }
//
//    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            
             AuthProvider.Instance.login(withEmail: emailTextField.text!, withPassword: passwordTextField.text!, loginHandler: { (message) in
                if message != nil {
                    print(message!)
                    self.UserAlert(title: "Problem about Authantication", message: message!)
                    
                }else{
                   self.performSegue(withIdentifier: self.MainSeque, sender: nil)
                }
            })
            
        } else {
            self.UserAlert(title: "Emtpy TextField", message: "Please dont emtpy email or password")
        }
        
    }
    
    @IBAction func signupBtn(_ sender: Any) {
    if emailTextField.text != "" && passwordTextField.text != "" && nameTextField.text != ""{
        AuthProvider.Instance.signUp(withEmail: emailTextField.text!, withPassword: passwordTextField.text!,withName: nameTextField.text!,loginHandler: { (message) in
            if message != nil {
            
                self.UserAlert(title: "Problem about new user Created", message: message!)
                
            }else {
                
                self.performSegue(withIdentifier: self.MainSeque, sender: nil)
            }
            
          })
        
        }else {
        
        self.UserAlert(title: "Emtpy TextField", message: "Please dont emtpy email, password or name")
        }
        
    }

    private func UserAlert(title: String , message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(ok)
        self.present(alert, animated: true)
        
    }
  
}
