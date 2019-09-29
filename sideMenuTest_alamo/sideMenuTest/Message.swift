	//
//  Message.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 04. 28..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation

    class Message {
        
        private var _message: String!
        private var _sender: String!

        private var _sentTime: String!
        
        
        var message: String {
            get {
                return _message
            }
        }
        
        var sender: String {
            get {
                return _sender
            }
        }
        
       
        
        var sentTime: String {
            get {
                return _sentTime
            }
        }
        
        init(message: String, sender: String, sentTime: String) {
            
            self._message = message
            self._sender = sender
           
            self._sentTime = sentTime
        }
        
    }
