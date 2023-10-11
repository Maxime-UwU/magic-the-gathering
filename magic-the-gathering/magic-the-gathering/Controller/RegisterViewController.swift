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

        if passwordField.text == confPasswordField.text {
            
            let newUsers =  ["name": usernameField.text,"password": passwordField.text]
            defaults.set(newUsers, forKey: "allUsers")

            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "wiki") as? WikiViewController{
                self.navigationController?.pushViewController(vc, animated: true)
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
