//
//  PushNoticeViewController.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 14..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class PushNoticeViewController: UIViewController {

    @IBOutlet weak var pushNoticeText: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        TasksProvider().loadPushMessage{ tasks in
            //self.pushNoticeText.text = String("\(tasks[1].message)")
            //print(String(tasks[0].message!))
            //var fos = tasks[0].message
            
            //let message =  fos as! String
            //self.pushNoticeText.text = message
            
            var fos = String("\(tasks[0].message)")
            //print(String("\(tasks[1].date)"))
            
            self.pushNoticeText.text = self.hexToStr(text: fos)
            print(self.hexToStr(text: fos))
            print(tasks.count)
            
            
        }
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(dismissView), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func dismissBtnPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func hexToStr(text: String) -> String {
        
        let regex = try! NSRegularExpression(pattern: "(0x)?([0-9A-Fa-f]{2})", options: .caseInsensitive)
        let textNS = text as NSString
        let matchesArray = regex.matches(in: textNS as String, options: [], range: NSMakeRange(0, textNS.length))
        let characters = matchesArray.map {
            Character(UnicodeScalar(UInt32(textNS.substring(with: $0.range(at: 2)), radix: 16)!)!)
        }
        
        return String(characters)
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }

}

