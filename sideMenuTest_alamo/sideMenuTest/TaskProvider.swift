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
    
    func loadTasks(_ completion: @escaping ([Task]) -> ()) {
        let query = OHMySQLQueryRequestFactory.select("user", condition: nil)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response as? [[String : Any]] else {
            completion([])
            return
        }
        
        var tasks = [Task]()
        for taskResponse in responseObject {
            let task = Task()
            task.map(fromResponse: taskResponse)
            tasks.append(task)
        }
        
        completion(tasks)
    }
}
