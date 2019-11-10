//
//  LogInVC.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 02. 23..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import UIKit
import OHMySQL
import Alamofire

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
        
        logInRequest()
    }

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
    
    func toBase62(password: String) -> String {
        let codedString = password.data(using: String.Encoding.utf8)!.base64EncodedString()
    
        return codedString
    }
    
    func fromBase64(password: String) -> String {
        let codedString = Data(base64Encoded: password)!
        let decodedString = String(data: codedString, encoding: .utf8)!
        
        return decodedString
    }
    
    func logInRequest() {
        
        if (userNameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            displayMessage(userMessage: "Mindkét mezőt ki kell tölteni!")
            return
        }
        let userName = userNameTextField.text!
        let password = toBase62(password: passwordTextField.text!)
        
        let parameters : Parameters = [
            "userName" : userName,
            "password" : password
        ]
    
        var succesfullLogin = false
        
        Alamofire.request("http://oktat.narasoft.hu/php/DeviceLogin.php", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print(response)
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let course = dict["course"] as? String {

                    UserDefaults.standard.set(course, forKey: "course")
                    UserDefaults.standard.set(self.userNameTextField.text, forKey: "userName")
                    UserDefaults.standard.set(self.passwordTextField.text, forKey: "password")
                    UserDefaults.standard.set("Default", forKey: "pushNotice")
                    UserDefaults.standard.synchronize()
                    succesfullLogin = true
                }
                else {
                    self.displayMessage(userMessage: "Hibás felhasználónév vagy jelszó!")
                    return
                }
                
                if let userId = dict["userId"] as? String {
                    
                    UserDefaults.standard.set(userId, forKey: "userId")
                    UserDefaults.standard.synchronize()
                }
                else {
                    self.displayMessage(userMessage: "Hibás felhasználónév vagy jelszó!")
                    return
                }
            }
            if succesfullLogin == true{
                self.performSegue(withIdentifier: "MenuVC", sender: nil)
            }
        }
    }
}
