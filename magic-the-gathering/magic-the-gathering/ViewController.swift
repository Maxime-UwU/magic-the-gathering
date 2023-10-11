//
//  ViewController.swift
//  magic-the-gathering
//
//  Created by Maxime NICOLAS on 10/10/2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let users = jsonResult["users"] as? [[String: AnyObject]] {
                            
                    for user in users {
                        print(user["username"]!)
                        print(user["password"]!)
                    }
                  }
              } catch {
                   // handle error
              }
        }
        
        
    }

}

