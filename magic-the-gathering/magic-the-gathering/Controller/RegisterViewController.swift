//
//  RegisterViewController.swift
//  magic-the-gathering
//
//  Created by Vahé Krikorian on 11/10/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var allUsers: [[String: String]] = []
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confPasswordField: UITextField!

    
    @IBAction func buttonRegister(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey:"users") as? [[String: String]] ?? [[String: String]]()
        print(value)
        
        if passwordField.text == confPasswordField.text {
            print(passwordField.text!)
            print(confPasswordField.text!)
            let newUsers =  ["name": usernameField.text!,"password": passwordField.text!    ]
            defaults.set(newUsers, forKey: "users")
            
            print(newUsers)
            print(defaults)
        

            
            

            if let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tabBar") as? UITabBarController {
                let wikiVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "wiki") as! WikiViewController
                tabBarController.viewControllers = [wikiVC]
                
                self.navigationController?.pushViewController(tabBarController, animated: true)
                self.navigationController?.navigationBar.tintColor = UIColor(red: 242/255.0, green: 190/255.0, blue: 42/255.0, alpha: 1)
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
