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

                let user =  ["name": "toto","password": "toto"]
                defaults.set(user, forKey: "user")

                let value = defaults.object(forKey:"user") as? [String: String] ?? [String: String]()
                print(value)
        
    }


}

