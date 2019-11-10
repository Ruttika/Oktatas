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
        

    }
    
    

}
