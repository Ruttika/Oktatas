//
//  PushMessage.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 14..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation
import OHMySQL

class PushMessage: NSObject, OHMappingProtocol {
    
    @objc var id: NSNumber?
    @objc var schedule_plan_data_id: NSNumber?
    @objc var date: NSDate?
    @objc var message: NSString?

    
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["id" : "id",
                "date" : "date",
                "schedule_plan_data_id" : "schedule_plan_data_id",
                "message" : "message"]
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
