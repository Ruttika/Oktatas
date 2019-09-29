//
//  AdScreen.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 02. 23..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit
import WebKit

class AdScreen: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webViewBot: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlTop = URL(string: "https://corvinkoz.hu/kozmetikus-tanfolyam-okj-csak-elmelet")
        let requestTop = URLRequest(url: urlTop!)
        webView.load(requestTop)
        
        let urlBot = URL(string: "https://corvinkoz.hu/kozmetikus-tanfolyam-okj")
        let requestBot = URLRequest(url: urlBot!)
        webViewBot.load(requestBot)
 
    }
}
