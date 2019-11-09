//
//  SchedulePlanData.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 11. 09..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation
import OHMySQL

class SchedulePlanData: NSObject, OHMappingProtocol {
    
    @objc var id: NSNumber!
    @objc var course_id: NSNumber!
    

    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["id" : "id",
                "course_id" : "course_id"]
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
