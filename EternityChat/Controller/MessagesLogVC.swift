//
//  SendMessageVC.swift
//  EternityChat
//
//  Created by Macbook on 8.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit
import FirebaseAuth

class MessagesLogVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UITextFieldDelegate{


     private let MessageLogCell = "messageLogCell"
     private let CollectionCell = "collectionCell"
    
    @IBOutlet weak var sendTextField: UITextField!
    
    var model: UserModel? {
    didSet {
        self.navigationItem.title = self.model!.name
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
     //navBarProfile()
       self.navigationController?.hidesBarsOnSwipe = true

    }
  
 
 
    @IBAction func sendMessage(_ sender: Any) {
        sendHandler()
        sendTextField.text = ""
    }
    
    
    private func sendHandler(){
      
     if sendTextField.text != "" {
        let timeStamp = NSDate().timeIntervalSince1970
        MessageHandler.Instance.saveMessage(fromId: Auth.auth().currentUser!.uid , toId: self.model!.id, text: sendTextField.text!, timestamp: Int(timeStamp))
         }
     
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendHandler()
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.CollectionCell, for: indexPath as IndexPath) as UICollectionViewCell
        
        return cell
    }

    
}

