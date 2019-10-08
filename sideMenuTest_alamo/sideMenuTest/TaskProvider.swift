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
    
    func loadTasks(_userName: String, completion: @escaping ([User]) -> ()) {
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
}
