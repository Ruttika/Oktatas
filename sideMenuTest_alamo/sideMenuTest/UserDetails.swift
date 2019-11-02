//
//  UserDetails.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 08..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation
import OHMySQL

class UserDetails: NSObject, OHMappingProtocol {
    
    @objc var student_id: NSNumber?
    @objc var taj: NSNumber?
//    @objc var birth_date: String?
    @objc var birth_place: String?
    @objc var home_address: String?
    @objc var mothers_name: String?
    @objc var phone_number: NSNumber?
    @objc var student_full_name: String?
    @objc var email: String?
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["student_id" : "student_id",
                "taj" : "taj",
//                "birth_date" : "birth_date",
                "birth_place" : "birth_place",
                "home_address" : "home_address",
                "mothers_name" : "mothers_name",
                "phone_number" : "phone_number",
                "student_full_name" : "student_full_name",
                "email" : "email"
        
        ]
        
    }
    
    func mySQLTable() -> String! {
        return "tasks"
    }
    
    func primaryKey() -> String! {
        return "taskId"
    }
}
