//
//  boosterViewController.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import UIKit

class boosterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = URLSessionConfiguration.default
              let session = URLSession(configuration: config)
              
              let url = URL(string: "https://api.magicthegathering.io")!
              
              let task = session.dataTask(with: url) { (data, response, error) in
                  if error != nil {
                      print(error!.localizedDescription)
                  } else {
                      if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                          if let data = json as? [String: AnyObject] {
                              
                              if let items = data["data"] as? [[String: AnyObject]] {
                                  for item in items {
                                      //print(item["link"]!)
                                      //self.browsers.append(item["link"]! as! String)
                                   //   if let booster = Boosters(json: item) {
                                   //     self.browsers.append(artist)
                                      }
                                      
                                  }
                              }
                          }
                      }
                  }
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
