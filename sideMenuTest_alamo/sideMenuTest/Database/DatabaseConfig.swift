//
//  DatabaseConfig.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 08..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation
import OHMySQL

class DatabaseConfig{
    
    func configureMySQL() {
        
        let user = OHMySQLUser(userName: "oktat", password: "corvin2019", serverName: "mysql.nethely.hu", dbName: "oktat", port: 3306, socket: "/Applications/MAMP/tmp/mysql/mysql.sock")
        let coordinator = OHMySQLStoreCoordinator(user: user!)
        coordinator.encoding = .UTF8MB4
        coordinator.connect()
        
        let context = OHMySQLQueryContext()
        context.storeCoordinator = coordinator
        OHMySQLContainer.shared.mainQueryContext = context
    }
    
}
