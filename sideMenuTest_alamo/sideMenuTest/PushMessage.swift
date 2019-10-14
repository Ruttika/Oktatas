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
    
    @objc var date: NSDate?
    @objc var message: String?

    
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["user_id": "user_id",
                "user_name": "user_name",]
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
