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
    var scheduleList: [Schedule] = []
    var scheduleDataList: [SchedulePlanData] = []
    
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
        
        if (firstOpen == false) {
            
            var actualUserScheduleId: NSNumber!
            TasksProvider().loadSchedulePlanData{ tasks in
                
                actualUserScheduleId = tasks[0].id
                UserDefaults.standard.set(actualUserScheduleId, forKey: "actualID")
                UserDefaults.standard.synchronize()
            }
            
            TasksProvider().loadPushMessages{ tasks in
                for task in tasks {
                    if task.schedule_plan_data_id == actualUserScheduleId {
                        self.messagesList.append(task)
                    }
                }
            }

            TasksProvider().loadSchedule{ tasks in
                
                let date = Date()
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd"
                let formattedDate = format.string(from: date)

                for task in tasks {
                    if (task.schedule_plan_data_id == actualUserScheduleId) && (task.date! > formattedDate) {
                        self.scheduleList.append(task)
                    }
                }
            }
            TasksProvider().loadPushMessage{ tasks in //NEED TO TEST IT
                print(tasks.count)
                let lastPushMessage = String("\(tasks[0].message)")
                
                let pushNotice = TextDecoder().hexToStr(text: lastPushMessage)
                
                if let currentPushMessage = UserDefaults.standard.object(forKey: "pushNotice") as? String {
                    print(currentPushMessage)
                    if currentPushMessage != pushNotice {
                        UserDefaults.standard.set(pushNotice, forKey: "pushNotice")
                        UserDefaults.standard.synchronize()
                    }
                }
            }
        }
        var timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(updateMessages), userInfo: nil, repeats: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow: Int!
        if (tableView == pushNoticeTableView ) {
            numberOfRow = messagesList.count
        } else if (tableView == scheduleTableView ) {
            numberOfRow = scheduleList.count
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellReturn = UITableViewCell()
        
        switch tableView {
        case pushNoticeTableView:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "pushNoticeCell", for: indexPath) as? PushNoticeCell {
                
                let message = messagesList[indexPath.row]
                
                cell.configureTableViewCell(pushmessage: message)
                //cell.transform = CGAffineTransform(rotationAngle: (.pi))
                
                 cellReturn = cell
            }else {
                
                cellReturn = UITableViewCell()
            }
        case scheduleTableView:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as? ScheduleCell {
                
                let schedule = scheduleList[indexPath.row]
                
                cell.configureTableViewCell(schedule: schedule)
                //cell.transform = CGAffineTransform(rotationAngle: (.pi))
                
                cellReturn = cell
            }else {
                
                cellReturn = UITableViewCell()
            }
            
        default:
            print("Baj van moni")
        }
        
        return cellReturn
    }
    
    
    @IBAction func update(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func updateMessages() {
        messagesList.removeAll()
        var id: NSNumber!
        
        if let password = UserDefaults.standard.object(forKey: "actualID") as? NSNumber{
            id = password
        }
        
        TasksProvider().loadPushMessages{ tasks in
            for task in tasks {
                if task.schedule_plan_data_id == id {
                    self.messagesList.append(task)
                }
            }
        }
        pushNoticeTableView.reloadData()
    }
}
