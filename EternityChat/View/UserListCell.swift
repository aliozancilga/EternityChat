//
//  UserListCell.swift
//  EternityChat
//
//  Created by Macbook on 8.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var ImageView: RoundedImageView!
    
    var userslist : UserModel? {
        didSet{
            
            self.email.text = self.userslist?.email
            self.name.text = self.userslist?.name
            
        }
        
        
        
    }
    
    
    
    
}
