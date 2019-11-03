//
//  HomeViewController.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 14..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

var firstOpen = true
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pushNoticeTableView: UITableView!
    @IBOutlet weak var scheduleTableView: UITableView!
    
    var messagesList: [PushMessage] = []
    
    override func viewDidAppear(_ animated: Bool) {
        
        if (firstOpen == true) {
            
            firstOpen = false
            performSegue(withIdentifier: "adVC", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushNoticeTableView.delegate = self
        pushNoticeTableView.dataSource = self
        
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        
        TasksProvider().loadPushMessages{ tasks in
            self.messagesList = tasks
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "pushNoticeCell", for: indexPath) as? PushNoticeCell {
            
            let message = messagesList[indexPath.row]

            cell.configureTableViewCell(pushmessage: message)
            //cell.transform = CGAffineTransform(rotationAngle: (.pi))
            
            return cell
        }else {
            
            return UITableViewCell()
        }
    }
    
    
    @IBAction func update(_ sender: Any) {
        
        TasksProvider().loadModul{ tasks in
            print(tasks[1].modul_name ?? "")
        }
        
        
        pushNoticeTableView.reloadData()
    }
}
