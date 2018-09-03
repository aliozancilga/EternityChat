//
//  UserModel.swift
//  EternityChat
//
//  Created by Macbook on 8.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation
class UserModel {
    private var _id = ""
    private var _name = ""
    private var _email = ""
    //private var _profileImage = nil
    
    
    init(id:String,name:String,email:String?) {
        _name = name
        _email = email!
      //  _profileImage = profileImage
        _id = id
    }
    
    var id: String {
        get {
          return _id
        }
    }
    
    var name: String {
        get{
        return _name
           }
    }
    var email: String? {
        get {
            return _email
        }
    }
//    var profileImage: String? {
//        get {
//            return _profileImage
//        }
//    }

    
    
}
