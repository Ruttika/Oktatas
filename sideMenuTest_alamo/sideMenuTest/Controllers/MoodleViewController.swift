//
//  MoodleViewController.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 12..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit
import WebKit

class MoodleViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://elearning.narasoft.hu/login")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(getPushNotice), userInfo: nil, repeats: false)
        
        
    }
    
    
    @objc func getPushNotice() { //NEED TO TEST IT
        
        if let currentPushMessage = UserDefaults.standard.object(forKey: "pushNotice") as? String {
        
            TasksProvider().loadPushMessage{ tasks in
                let lastPushMessage = String("\(tasks[0].message)")
                let pushNotice = TextDecoder().hexToStr(text: lastPushMessage)
            
                    if currentPushMessage != pushNotice {
                        UserDefaults.standard.set(pushNotice, forKey: "pushNotice")
                        UserDefaults.standard.synchronize()
                        self.performSegue(withIdentifier: "adVC", sender: nil)
                    }
            }
        }
    }
}
