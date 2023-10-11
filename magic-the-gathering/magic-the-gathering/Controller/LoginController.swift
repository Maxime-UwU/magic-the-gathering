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
            vc.hidesBottomBarWhenPushed = false
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.navigationBar.tintColor = UIColor(red: 63/255.0, green: 63/255.0, blue: 63/255.0, alpha: 1)
        }
    }
    
    var allUsers: [[String: String]] = []
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        allUsers.forEach { user in
            if user["name"] == usernameField.text {
                if user["password"] == passwordField.text {
                    if let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tabBar") as? UITabBarController {
                        let wikiVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "wiki") as! WikiViewController
                        tabBarController.viewControllers = [wikiVC]
                        
                        self.navigationController?.pushViewController(tabBarController, animated: true)
                        self.navigationController?.navigationBar.tintColor = UIColor(red: 242/255.0, green: 190/255.0, blue: 42/255.0, alpha: 1)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://api.magicthegathering.io/v1/sets/ktk/booster")!
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
 
            if error != nil {
                print(error!.localizedDescription)
            } else {
 
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [String: AnyObject] {
                        print(data)
                        // if let items = data["data"] as? [[String: AnyObject]] {
                        //for item in items {
                        //print(item["link"]!)
                        //self.browsers.append(item["link"]! as! String)
                        //   if let booster = Boosters(json: item) {
                        //     self.browsers.append(artist)
                        //      }
                        
                    }
                }
            }
        }
        
        dataTask.resume()
    
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

