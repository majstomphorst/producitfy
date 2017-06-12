//
//  HistoryViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 07/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var items = [String]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.items = [String]()
        
        if let userId = Auth.auth().currentUser?.uid {
            
            // getting al "messages" data
            Database.database().reference().child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
                
                
                // interpeting the made "snapshot" as a dictionary
                if let act = snapshot.value as? NSDictionary {
                    
                    for key in act.allKeys {
                        
                        let dict = act[key] as! NSDictionary
                        
                        self.items.append(dict["todo"] as! String)
                        
                    }
                    
                    self.tableView.reloadData()
                    
                }
                
                
            }, withCancel: { (error) in
                print(error.localizedDescription)
            })
            
        }
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.historyLabel.text = items[indexPath.row]
        
        return cell
    }
    
    
    
}
