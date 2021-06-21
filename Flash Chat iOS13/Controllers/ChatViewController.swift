//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    
    var messages : [Message] = [
        Message(sender: "1@2.com", body: "Hi"),
        Message(sender: "1@3.com", body: "Everyone"),
        Message(sender: "1@4.com", body: "Let's have some Beer?")

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier )

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
       } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
       }
    }
    
}


extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
    
    
    
    
}


