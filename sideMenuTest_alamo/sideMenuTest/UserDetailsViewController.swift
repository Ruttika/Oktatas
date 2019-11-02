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
        updateUserDetailsUI()
    }
    
    func updateUserDetailsUI() {
        
        TasksProvider().loadUserDetails { tasks in
            self.tasks = tasks
            
            self.fullNameLbl.text = tasks[0].student_full_name ?? ""
            let taj = Int(tasks[0].taj!)
            self.tajLbl.text = String(taj)
            self.birthPlaceLbl.text = tasks[0].birth_place
            self.homeAddressLbl.text = tasks[0].home_address
            self.mothersNameLbl.text = tasks[0].mothers_name
            let phoneNumberTmp = Int(tasks[0].phone_number!)
            self.phoneNumberLbl.text = String(phoneNumberTmp)
            self.fullNameLbl.text = tasks[0].student_full_name
            self.emailLbl.text = tasks[0].email
        }
    }
    @IBAction func kecske(_ sender: Any) {
        performSegue(withIdentifier: "adVC", sender: nil)
    }
    
    @IBAction func pushednotice(_ sender: Any) {
        PushMessageTask().getPushMessage()
    }
    
}
