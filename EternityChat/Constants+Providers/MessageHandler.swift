//
//  MessageHandleProvider.swift
//  EternityChat
//
//  Created by Macbook on 8.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


protocol UserListController:class {
    func dataReceived(userData: [UserModel])
 }
protocol MessageObserverController:class {
   func messageObserverHandler(messageData: [Message])
 
 }
class MessageHandler {
    
    weak var delegete: UserListController?
    weak var observerdelegete: MessageObserverController?
    
    
    // Singleton
    private static let _instance =  MessageHandler()
    private init(){}

    static var Instance : MessageHandler {
        return _instance
    }
    
    func saveMessage(fromId:String,toId:String,text:String,timestamp:Int,imageUrl:String? = nil,videoUrl:String? = nil){
        let data: Dictionary<String,Any> = [Constants.FromId: fromId,Constants.ToId: toId, Constants.Text: text, Constants.Timestamp: timestamp,Constants.ImageUrl: imageUrl as Any, Constants.VideoUrl: videoUrl as Any]
        
        DBProvider.Instance.dbMessages.childByAutoId().updateChildValues(data) { (error, dbref) in
            if error != nil {
                print(error! as NSError)
                return
            }
            let messageId = dbref.key
            DBProvider.Instance.dbUserMessages.child(fromId).updateChildValues([messageId : 1])
        
            DBProvider.Instance.dbUserMessages.child(toId).updateChildValues([messageId : 1])
        
        }
        
     }
    
    func userListFetch(){
        DBProvider.Instance.dbUser.observeSingleEvent(of: DataEventType.value) { (snapshot: DataSnapshot) in
            var userfetch = [UserModel]()

            if let userdata = snapshot.value as? NSDictionary {
                 for (key, value) in userdata {
                    if let data = value as? NSDictionary {
                        guard let email = data[Constants.Email] as? String else{return }
                        guard let name = data[Constants.Name] as? String  else {return }
                    //   guard let profileImage = data[Constants.ProfileImage] as? String  else { return  }
                        guard let id = key as? String else {return }
                        
                        let usermodel = UserModel(id: id, name: name, email: email)
                           userfetch.append(usermodel)
                     }
                }
           
            }
            
                 self.delegete?.dataReceived(userData: userfetch)
        }
 
    }
    
   var messages = [Message]()
   var messageDictionary = [String: Message]()
        func observerMesage(){
        //let currentId = AuthProvider.Instance.userId()
             DBProvider.Instance.dbMessages.observe(.childAdded) { (snapshot) in
                if snapshot.exists(){
                    
                 if let dictionary = snapshot.value as?  [String : AnyObject] {
                    let message = Message()
 
                       message.setValuesForKeys(dictionary)
                    
                         //self.messages.append(message)
                    if let toId = message.toId {
                             self.messageDictionary[toId] = message
                            self.messages = Array(self.messageDictionary.values)
                             self.messages.sort(by: { (message1, message2) -> Bool in
                                return message1.timestamp!.intValue > message2.timestamp!.intValue
                            })
                              self.observerdelegete?.messageObserverHandler(messageData: self.messages)
                        }
                    }
                }
            }
        }
    
    func getUser(_ toId: String, completion: @escaping (_ user: NSDictionary)->()){        
        DBProvider.Instance.dbUser.child(toId).observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            if snapshot.exists() {
               //let currentId = AuthProvider.Instance.userId()

                if let user = snapshot.value as? NSDictionary {
                          completion(user)
                    
                    
                }
            }
        }
    }
    
 
    

    
}
