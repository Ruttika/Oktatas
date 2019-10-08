//
//  UserDetailsViewController.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 10. 08..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var tajLbl: UILabel!
    @IBOutlet weak var birthDateLbl: UILabel!
    @IBOutlet weak var birthPlaceLbl: UILabel!
    @IBOutlet weak var homeAddressLbl: UILabel!
    @IBOutlet weak var mothersNameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    private var tasks = [UserDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DatabaseConfig().configureMySQL()
        var fos = 116753670
        
    }
    @IBAction func buttonpush(_ sender: Any) {
        
        TasksProvider().loadUserDetails { tasks in
            self.tasks = tasks
            print(tasks.count)
            
            
            self.fullNameLbl.text = tasks[0].student_full_name ?? ""
            self.tajLbl.text = NSString(tasks[0].taj)
            
            
        }
    }
}
