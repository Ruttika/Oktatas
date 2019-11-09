//
//  TaskProvider.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 09. 29..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation
import OHMySQL

class TasksProvider {
    
    func loadUser(_userName: String, completion: @escaping ([User]) -> ()) {
        print(_userName)
        let query = OHMySQLQueryRequestFactory.select("user", condition: "user_name = '\(_userName)'")
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [User]()
        for taskResponse in responseObject {
            let task = User()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
    func loadUserDetails(completion: @escaping ([UserDetails]) -> ()) {
        //print(_taj)
        let query = OHMySQLQueryRequestFactory.select("students", condition: nil)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [UserDetails]()
        for taskResponse in responseObject {
            let task = UserDetails()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
    func loadPushMessage(completion: @escaping ([PushMessage]) -> ()) {

        let query = OHMySQLQueryRequestFactory.selectFirst("push_notice", condition: nil, orderBy: ["date"], ascending: false)
        
        //let query = OHMySQLQueryRequestFactory.selectFirst("push_notice", condition: nil, orderBy: ["date"], ascending: true)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [PushMessage]()
        for taskResponse in responseObject {
            let task = PushMessage()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
    func loadPushMessages(completion: @escaping ([PushMessage]) -> ()) {
        
        let query = OHMySQLQueryRequestFactory.select("push_notice", condition: nil, orderBy: ["date"], ascending: false)
        //let query = OHMySQLQueryRequestFactory.selectFirst("push_notice", condition: nil, orderBy: ["date"], ascending: true)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [PushMessage]()
        for taskResponse in responseObject {
            let task = PushMessage()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
    func loadModul(completion: @escaping ([Modul]) -> ()) {
        
        let query = OHMySQLQueryRequestFactory.select("modul", condition: nil)
        //let query = OHMySQLQueryRequestFactory.selectFirst("push_notice", condition: nil, orderBy: ["date"], ascending: true)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [Modul]()
        for taskResponse in responseObject {
            let task = Modul()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
    func loadSchedule(completion: @escaping ([Schedule]) -> ()) {
        
        //let query = OHMySQLQueryRequestFactory.select("modul", condition: nil)
        //let query = OHMySQLQueryRequestFactory.selectFirst("push_notice", condition: nil, orderBy: ["date"], ascending: true)
        let query = OHMySQLQueryRequestFactory.joinType(OHJoinInner, fromTable: "schedule_plan", columnNames: ["id", "schedule_plan_data_id", "date", "modul_name", "modul_start_hour", "modul_end_hour"], joinOn: ["modul" : "modul.modul_id=schedule_plan.used_modul_id"])
        
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [Schedule]()
        for taskResponse in responseObject {
            let task = Schedule()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
    func loadSchedulePlanData(completion: @escaping ([SchedulePlanData]) -> ()) {
        var courseID: String!
        if let course = UserDefaults.standard.object(forKey: "course") as? String {
            courseID = course
        }
        print(courseID)
        //let query = OHMySQLQueryRequestFactory.select("schedule_plan_data", condition: "course_id = '\(courseID ?? "")'") ez lenne a jó de nem lehet tesztelni....
        let query = OHMySQLQueryRequestFactory.select("schedule_plan_data", condition: "course_id = 2")
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [SchedulePlanData]()
        for taskResponse in responseObject {
            let task = SchedulePlanData()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
    
}
