//
//  ConformationViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 07/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class ConformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func SaveButton(_ sender: Any) {
        print(ActivityInfo.activityInfo)
        if let userId = Auth.auth().currentUser?.uid {
            
            let date = NSDate()
            let calendar = NSCalendar.current
            let day = calendar.component(.day, from: date as Date)
            let month = calendar.component(.month, from: date as Date)
            let year = calendar.component(.year, from: date as Date)
            print("the current date =  \(day):\(month):\(year):")
            
            let hour = calendar.component(.hour, from: date as Date)
            print(day)
            print(hour)
            
            
            //let reference = Database.database().reference().child(userId).child("activitys").child(<#T##String#>)
            
        }

        
        
        
        
    }
    
    // sends the user back to the privious screen
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

