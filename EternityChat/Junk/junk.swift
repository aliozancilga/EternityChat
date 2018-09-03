    
    //    private func navBarProfile(){
    //
    //        let navController = navigationController!
    //
    //        let image = #imageLiteral(resourceName: "LaunchLogo")
    //        let imageView = UIImageView(image: image)
    //
    //        let bannerWidth = navController.navigationBar.frame.size.width
    //        let bannerHeight = navController.navigationBar.frame.size.height
    //
    //        let bannerX = bannerWidth / 2 - image.size.width
    //        let bannerY = bannerHeight / 2 - image.size.height
    //        imageView.frame = CGRect(x: bannerX , y: bannerY, width: bannerWidth, height: bannerHeight)
    //        imageView.contentMode = .scaleAspectFit
    //        navigationItem.titleView = imageView
    //
    //
    //    }

    
    
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    //    {
    //
    //        return 4
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    //    {
    //
    //        return 1;
    //    }
    
    
//
//    DBProvider.Instance.dbUser.child(toId).observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
//        if snapshot.exists() {
//            if let user = snapshot.value as? NSDictionary {
//                self.profileImage?.image = UIImage(named: "LaunchLogo")
//                self.lastMessage.text = self.message?.text
//                self.name.text = user[Constants.Name] as? String
//                self.lastTimeSeen.text = timeConverter(NSNumber(value: self.message!.timestamp))
//
//            }
//        }
//    }
    
    
//let currentuser = Auth.auth().currentUser!.uid

    
    
    
    
//    var messagesFetch = [MessageModel]()
//    var messageDictionary = [String: MessageModel]()
//
//    func observerMessage(){
//
//        DBProvider.Instance.dbMessages.observe(DataEventType.childAdded) { (snapshot: DataSnapshot) in
//
//            if let message = snapshot.value as? NSDictionary {
//
//                                     let id = snapshot.key
//                                    guard let fromId = message[Constants.FromId] as? String else {return}
//                                    guard let toId = message[Constants.ToId] as? String else {return}
//                                    guard let timestamp = message[Constants.Timestamp] as? Int else {return}
//                                    guard let text = message[Constants.Text] as? String else {return}
//
//
//                                    let messagemodel = MessageModel(id: id, toId: toId, fromId: fromId, timestamp: timestamp, text: text)
//
//
//                 self.messagesFetch.append(self.messagemodel)
//
//            }
//
//            self.observerdelegete?.messageObserverHandler(messageData: self.messagesFetch)
//
//    }
//

//---------------------------------------------------------------
    
    // var messageDictionary = [String: Message]()
    
    //    func observerMesage(){
    //        DBProvider.Instance.dbMessages.observe(.childAdded) { (snapshot) in
    //            if snapshot.exists(){
    //                if let dictionary = snapshot.value as?  [String : AnyObject] {
    //                    let message = Message()
    //                    message.setValuesForKeys(dictionary)
    //                    //self.messages.append(message)
    //                    if let toId = message.toId {
    //                        self.messageDictionary[toId] = message
    //                        self.messages = Array(self.messageDictionary.values)
    //                        self.messages.sort(by: { (message1, message2) -> Bool in
    //                            return message1.timestamp!.intValue > message2.timestamp!.intValue
    //                        })
    //                    }
    //
    //                    DispatchQueue.main.async {
    //                        self.tableview.reloadData()
    //                    }
    //
    //                }
    //
    //            }
    //
    //        }
    //
    //    }

    //---------------------------------------------------------------

//    let currentId = AuthProvider.Instance.userId()
//    var chatPartnerId: String?
//
//    if message.toId == currentId {
//        chatPartnerId = message.toId
//    }else{
//        chatPartnerId = message.fromId
//    }
    
    
    
    
    
    
    
