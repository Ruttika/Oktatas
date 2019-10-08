//
//  Task.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 09. 29..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation

import OHMySQL

class User: NSObject, OHMappingProtocol {
    
    @objc var user_id: NSNumber?
    @objc var user_name: String?
    @objc var password: String?
    
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["user_id": "user_id",
                "user_name": "user_name",
                "password": "password"]
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
