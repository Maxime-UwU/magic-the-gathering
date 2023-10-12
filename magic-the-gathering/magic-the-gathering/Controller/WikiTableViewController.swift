//
//  TableViewController.swift
//  test2
//
//  Created by Maxime NICOLAS on 10/10/2023.
//

import UIKit

struct Gatherer {
    let name: String
    let urlPage: String
    let multiverseId : String
    
    }
let url = "https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid="

extension Gatherer {
    init?(json: [String: AnyObject]){
        guard let name = json["name"] as? String,
              let cardId = json["multiverseid"] as? String
        else {
            return nil
        }
        self.name = name
        self.multiverseId = cardId
        self.urlPage = url + cardId
    }
}



class WikiTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        //API Deezer

                let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                
                let url = URL(string: "https://api.magicthegathering.io/v1/cards/")!
                
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                            if let data = json as? [String: AnyObject] {
                                print(data)
                                if let items = data["cards"] as? [[String: AnyObject]] {
                                    for item in items {
                                        print(item)
                                        //self.browsers.append(item["link"]! as! String)
                                        if let card = Gatherer(json: item) {
                                          self.card.append(card)
                                            print(self.card)

                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                task.resume()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    var card: [Gatherer] = []


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return card.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = self.card[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "webview") as? WikiWebViewController {

                vc.linkBrowser = self.card[indexPath.row].urlPage

                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
