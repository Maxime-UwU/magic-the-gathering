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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

