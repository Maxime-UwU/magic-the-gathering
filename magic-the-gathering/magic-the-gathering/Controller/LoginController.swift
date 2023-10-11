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
    
    var allUsers: [[String: String]] = []
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        allUsers.forEach { user in
            print(user["names"]!)
            print(usernameField)
            if user["name"] == usernameField.text{
                print("same username ")
                if user["password"] == passwordField.text{
                    print("log in")
                    
                }
                
            }
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
                        defaults.set(25, forKey: "Age")
                        defaults.set(true, forKey: "UseTouchID")
                        defaults.set(CGFloat.pi, forKey: "Pi")

                        let array = ["Hello", "World"]
                        defaults.set(array, forKey: "SavedArray")

                        let test = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
                        print(test)

                        let users =  [["name": "toto","password": "toto"],["name": "root","password": "root"]]
                        defaults.set(users, forKey: "users")

                        let value = defaults.object(forKey:"users") as? [[String: String]] ?? [[String: String]]()
                        print(value)
                        allUsers = value
    }
}

