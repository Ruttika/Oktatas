//
//  PushMessageTask.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 16..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation

class PushMessageTask{

    var messages = [PushMessage]()
    func getPushMessage() {
    
        TasksProvider().loadPushMessage{ tasks in
            self.messages = tasks
        print(tasks.count)
        }
    }
    
    func getPushMessagesArray() -> Array<Any>{
        return messages
    }
    
}
