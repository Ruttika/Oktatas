//
//  Schedule.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 11. 03..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation
import OHMySQL

class Schedule: NSObject, OHMappingProtocol {
    
    @objc var id: NSNumber?
    @objc var schedule_plan_data_id: NSNumber?
    @objc var date: String?
    @objc var modul_name: String?
    @objc var mmodul_start_hour: NSNumber?
    @objc var mondul_end_hour: NSNumber?
    
    
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["id" : "id",
                "schedule_plan_data_id" : "schedule_plan_data_id",
                "date" : "date",
                "modul_name" : "modul_name",
                "mmodul_start_hour" : "mmodul_start_hour",
                "mondul_end_hour" : "mondul_end_hour"]
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
