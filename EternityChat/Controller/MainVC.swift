//
//  MainVC.swift
//  EternityChat
//
//  Created by Macbook on 7.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit
class MainVC: UIViewController, MessageObserverController {
  

    private let MessageCell = "messageCell"
    private let MessageSegue = "messageSegue"

    
    fileprivate var messages = [Message]()

 
@IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Messages"
 
        MessageHandler.Instance.observerdelegete = self
        MessageHandler.Instance.observerMesage()
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutBtn))
      }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.messages.removeAll()
//         DispatchQueue.main.async{
//        self.tableview.reloadData()
//            }
//     }
//


    @objc func LogoutBtn() {
    
    if AuthProvider.Instance.logout() {
          dismiss(animated: true, completion: nil)
      }
    }
    
    func messageObserverHandler(messageData: [Message]) {
       self.messages = messageData
        DispatchQueue.main.async {
           self.tableview.reloadData()
        }
     }
}

extension MainVC: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return messages.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.MessageCell, for: indexPath) as! MessagesCell
       
        let messagecell = messages[indexPath.row]

        cell.message = messagecell

        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell, for: indexPath) as? MessagesCell
//
//
//     }
    
}
