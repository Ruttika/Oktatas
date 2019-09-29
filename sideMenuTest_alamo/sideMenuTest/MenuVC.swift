//
//  MenuVC.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 02. 23..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit


class MenuVC: UIViewController{


    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mess = Message( message: "keceeeeeeeeeeeeeske", sender: "Pista", sentTime: "2111.11.11")
        let mess1 = Message(message: "kecske", sender: "Feri",  sentTime: "2111.11.11")
        let mess2 = Message(message: "kecske", sender: "Orbán", sentTime: "2111.11.11")
        let mess3 = Message(message: "kecske", sender: "Pista" , sentTime: "2111.11.11")
        let mess4 = Message( message: "keceeeeeeeeeeeeeske", sender: "Pista", sentTime: "2111.11.11")
        let mess5 = Message(message: "kecske", sender: "Feri",  sentTime: "2111.11.11")
        let mess6 = Message(message: "kecske", sender: "Orbán", sentTime: "2111.11.11")
        let mess7 = Message(message: "kecske", sender: "Pista" , sentTime: "2111.11.11")
        messages.append(mess)
        messages.append(mess1)
        messages.append(mess2)
        messages.append(mess3)
        messages.append(mess4)
        messages.append(mess5)
        messages.append(mess6)
        messages.append(mess7)
        
     
       // messageTableView.transform = CGAffineTransform(rotationAngle: ( .pi))
 
    }
    
    @IBAction func facebookGroupBnt(_ sender: Any) {
        let application = UIApplication.shared
        let secondAppPath = "second://"
        let appUrl = URL(string: secondAppPath)!
        let websiteUrl = URL(string: "https://kiloloco.com")!
        
        if application.canOpenURL(appUrl) {
            
            application.open(appUrl, options: [:], completionHandler: nil)
            
        }else {
            application.open(websiteUrl)
        }
        
    }
    
    @IBAction func logOutBtnPushed(_ sender: Any) {
        
    }
    
    
}
