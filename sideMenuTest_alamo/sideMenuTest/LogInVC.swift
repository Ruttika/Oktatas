//
//  LogInVC.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 02. 23..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit
import OHMySQL

class LogInVC: UIViewController {
   
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var tasks = [User]()
    private var push = [PushMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DatabaseConfig().configureMySQL()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let userName = UserDefaults.standard.object(forKey: "userName") as? String {
            self.userNameTextField.text = userName
        }
        if let password = UserDefaults.standard.object(forKey: "password") as? String {
            self.passwordTextField.text = password
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearBackBtnPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logInBtn(_ sender: Any) {
        
        let userName = userNameTextField.text
        let userPassword = passwordTextField.text
        
        if (userName?.isEmpty)! || (userPassword?.isEmpty)! {
            displayMessage(userMessage: "Mindkét mezőt ki kell tölteni!")
            return
        }
        
        TasksProvider().loadUser(_userName: userNameTextField.text!) { tasks in
            self.tasks = tasks
            print(tasks.count)
            
            for index in 0..<tasks.count {
                print(tasks[index].user_name ?? ""," : ", tasks[index].password ?? "" )
            }
            
            //for index in 0..<tasks.count {
                
            if (userName == tasks[0].user_name ?? "") && (userPassword == tasks[0].password ?? "" ) {
                    
                UserDefaults.standard.set(self.userNameTextField.text, forKey: "userName")
                UserDefaults.standard.set(self.passwordTextField.text, forKey: "password")
                UserDefaults.standard.synchronize()
                    
                self.performSegue(withIdentifier: "MenuVC", sender: nil)
                }
            //}
            self.displayMessage(userMessage: "Hibás adatok!")
            return
        }
        

    }
 
//    private func configureMySQL() {
//
//        let user = OHMySQLUser(userName: "oktat", password: "corvin2019", serverName: "mysql.nethely.hu", dbName: "oktat", port: 3306, socket: "/Applications/MAMP/tmp/mysql/mysql.sock")
//        let coordinator = OHMySQLStoreCoordinator(user: user!)
//        coordinator.encoding = .UTF8MB4
//        coordinator.connect()
//
//        let context = OHMySQLQueryContext()
//        context.storeCoordinator = coordinator
//        OHMySQLContainer.shared.mainQueryContext = context
//    }

    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                DispatchQueue.main.async {
                   // self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true)
        }
    }
}
