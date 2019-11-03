//
//  Modul.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 11. 03..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//



import Foundation
import OHMySQL

class Modul: NSObject, OHMappingProtocol {
    
    @objc var modul_name: String?

    
    
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["modul_name" : "modul_name"]
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
