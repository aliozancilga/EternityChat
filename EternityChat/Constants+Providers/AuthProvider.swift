//
//  AuthProvider.swift
//  EternityChat
//
//  Created by Macbook on 7.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation
import FirebaseAuth
typealias LoginHandler = (_ msg: String?) ->Void

struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid Email Adress"
    static let WRONG_PASSWORD = "Wrong Password"
    static let PROBLEM_CONNECTING = "problem Connecting to Database"
    static let USER_NOT_FOUND = "User Not Found, Please Register"
    static let EMAIL_ALREADY_IN_USE = "Email Already using"
    static let WEAK_PASSWORD = "Weak Password"
}


class AuthProvider{
    // Singleton
    private static let _instance = AuthProvider()
    private init(){}
    static var Instance: AuthProvider   {
        return _instance
    }
    
    
    
    
    func login(withEmail:String , withPassword: String, loginHandler: LoginHandler?)
    {
        Auth.auth().signIn(withEmail: withEmail, password: withPassword) { (user, error) in
            
            if error != nil {
                
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
                
            }else{
                loginHandler?(nil)
                
            }
            
            
        }
        
        
    }
    
    func signUp(withEmail: String, withPassword: String,withName:String,loginHandler: LoginHandler?) {
        Auth.auth().createUser(withEmail: withEmail, password: withPassword) { (user, error) in
            if error != nil{
                
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
                
            }else{
                
                if user?.uid != nil {
                self.saveUser(withId: user!.uid, withEmail: withEmail, withName: withName, withImage: nil)
                
                self.login(withEmail: withEmail, withPassword: withPassword, loginHandler: loginHandler)
                }
                
            }
        }
    }
    
    func isLoggedIn() -> Bool {
        
        if Auth.auth().currentUser != nil {
           return true
        }
        return false
        
    }
    
    func logout()-> Bool{
        if Auth.auth().currentUser?.uid != nil {
            do{
                try Auth.auth().signOut()
                
                return true
            }catch{
                return false
            }
        }
            return true
    }
    
    func userId() -> String {
        
       return Auth.auth().currentUser!.uid
     
    }
    
    private func handleErrors(err: NSError, loginHandler: LoginHandler?){
        if let errCode = AuthErrorCode(rawValue: err.code) {
            switch errCode {
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL)
                break;
            case .wrongPassword:
                loginHandler!(LoginErrorCode.WRONG_PASSWORD)
                break;
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE)
                break;
            case .tooManyRequests:
                print("many Request")
                break;
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND)
                break;
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD)
                break;
            default:
                loginHandler!(LoginErrorCode.PROBLEM_CONNECTING)
                break;
                
            }
        }
    }

    func saveUser(withId:String,withEmail:String,withName:String,withImage:UIImage?)  {
        let data:Dictionary<String,Any> = [Constants.Email: withEmail, Constants.Name: withName];   DBProvider.Instance.dbRef.child(Constants.Users).child(withId).setValue(data)

    }
    
    
    
    
    
}
