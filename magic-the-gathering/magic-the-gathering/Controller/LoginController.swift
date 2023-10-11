//
//  ViewController.swift
//  magic-the-gathering
//
//  Created by Maxime NICOLAS on 10/10/2023.
//

import UIKit

class LoginController: UIViewController {
    
    @IBAction func goRegister(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Register") as? RegisterViewController {
            // Masquer la barre d'onglets lorsque SecondViewController est poussé
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.navigationBar.tintColor = UIColor(red: 63/255.0, green: 63/255.0, blue: 63/255.0, alpha: 1)
        }
    }
    
    var allUsers: [[String: AnyObject]] = []
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func buttonLogin(_ sender: UIButton) {
//        for user in allUsers {
//            
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let users = jsonResult["users"] as? [[String: AnyObject]] {
                    allUsers = users
                    for user in users {
                        print(user["username"]!)
                        print(user["password"]!)
                        print(allUsers)
                    }
                }
            } catch {
                // handle error
            }
        }
    }
}

