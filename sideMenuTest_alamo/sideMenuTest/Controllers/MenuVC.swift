//
//  MenuVC.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 02. 23..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit


class MenuVC: UIViewController{


 
        
     
       // messageTableView.transform = CGAffineTransform(rotationAngle: ( .pi))
 
    
    
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
