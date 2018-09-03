//
//  UserListVC.swift
//  EternityChat
//
//  Created by Macbook on 8.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit
 class UserListVC: UIViewController, UserListController{
    
    @IBOutlet weak var userTableView: UITableView!
    private let userMCell = "userMCell"
    private let userMSegue = "userListSegue"
    fileprivate var users = [UserModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        MessageHandler.Instance.delegete = self
        MessageHandler.Instance.userListFetch()
        
        }
    func dataReceived(userData: [UserModel]) {
        self.users = userData
          DispatchQueue.main.async {
        self.userTableView.reloadData()
            
        }
        
    }

}

extension UserListVC: UITableViewDelegate, UITableViewDataSource {
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return users.count 
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: self.userMCell, for: indexPath) as! UserListCell
        
    let userindex = users[indexPath.row]
        
      cell.userslist = userindex
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let user = self.users[indexPath.row]
             self.performSegue(withIdentifier: self.userMSegue, sender: user)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? MessagesLogVC else {return}
        guard let userData = sender as? UserModel else {return}
        destination.model = userData
    
    }

    
}
