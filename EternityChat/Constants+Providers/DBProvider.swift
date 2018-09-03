//
//  DBProvider.swift
//  EternityChat
//
//  Created by Macbook on 7.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
 
class DBProvider{
    
    
    //Singleton
    private static let _instance =  DBProvider()
    private init(){}

    static var Instance : DBProvider {
        return _instance
    }
    
    var dbRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var dbUser: DatabaseReference {
        return dbRef.child(Constants.Users)
    }
    
    var dbMessages: DatabaseReference {
        return dbRef.child(Constants.Messages)
    }
    
    var dbUserMessages: DatabaseReference {
        return dbRef.child(Constants.UsersMessages)
    }
    
    var storage: StorageReference {
        return Storage.storage().reference(forURL: "gs://eternitychat-13d98.appspot.com")
    }
    var storageMessageImages: StorageReference {
        return storage.child(Constants.StorageMessageImages)
    }
    
    var storageProfileImages: StorageReference {
        return storage.child(Constants.StorageProfileImage)
    }
    var storageMessageVideos: StorageReference {
        return storage.child(Constants.StorageMessageVideos)
    }

}
