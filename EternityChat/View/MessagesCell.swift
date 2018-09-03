//
//  MessagesCell.swift
//  EternityChat
//
//  Created by Macbook on 8.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit
 class MessagesCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var lastTimeSeen: UILabel!
    @IBOutlet weak var profileImage: RoundedImageView?
     let currentId = AuthProvider.Instance.userId()

     var message: Message? {
        
     didSet {
        getId()
        }
     } //Didset

   
    
    private func getId(){
        var chatPartnerId: String?
        
        if message?.toId == currentId {
            chatPartnerId = message?.fromId
        } else if message?.fromId == currentId {
            chatPartnerId = message?.toId
        }
        
        if let id = chatPartnerId {
             MessageHandler.Instance.getUser(id, completion: { (user) in
                self.profileImage?.image = UIImage(named: "LaunchLogo")
                self.lastMessage.text = self.message?.text
                self.name.text = user[Constants.Name] as? String
                self.lastTimeSeen.text = timeConverter(self.message!.timestamp!)
            })
        }
    }
    
}

