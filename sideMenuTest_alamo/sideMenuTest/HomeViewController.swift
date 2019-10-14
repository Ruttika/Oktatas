//
//  HomeViewController.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 14..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    var firstOpen = true
    
    override func viewDidAppear(_ animated: Bool) {
        if (firstOpen == true) {
            
            firstOpen = false
            //performSegue(withIdentifier: "adVC", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    



}
