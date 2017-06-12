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

    
    //MARK: - Outlets
    
    @IBOutlet weak var sadButtonLabel: UIButton!
    @IBOutlet weak var neutralButtonLabel: UIButton!
    @IBOutlet weak var happyButtonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func sadButton(_ sender: Any) {
        
        if sadButtonLabel.backgroundColor == UIColor.blue {
            ActivityInfo.activityInfo.feeling = 3
            sadButtonLabel.backgroundColor = UIColor.clear
        } else {
            ActivityInfo.activityInfo.feeling = -1
            sadButtonLabel.backgroundColor = UIColor.blue
        }
        
    }
    
    @IBAction func neutralButton(_ sender: Any) {
        
        if neutralButtonLabel.backgroundColor == UIColor.blue {
            ActivityInfo.activityInfo.feeling = 3
            neutralButtonLabel.backgroundColor = UIColor.clear
        } else {
            ActivityInfo.activityInfo.feeling = 0
            neutralButtonLabel.backgroundColor = UIColor.blue
        }
        
    }
    
    @IBAction func happyButton(_ sender: Any) {
        
        if happyButtonLabel.backgroundColor == UIColor.blue {
            ActivityInfo.activityInfo.feeling = 3
            happyButtonLabel.backgroundColor = UIColor.clear
        } else {
            ActivityInfo.activityInfo.feeling = 1
            happyButtonLabel.backgroundColor = UIColor.blue
        }
    }
    
    
    @IBAction func SaveButton(_ sender: Any) {
        print(ActivityInfo.activityInfo)
        if let userId = Auth.auth().currentUser?.uid {
            
            let date = NSDate()
            let calendar = NSCalendar.current
            let day = calendar.component(.day, from: date as Date)
            let month = calendar.component(.month, from: date as Date)
            let year = calendar.component(.year, from: date as Date)
            let datum = "\(day):\(month):\(year)"
            
            print("the current date =  \(day):\(month):\(year)")
            
            let hour = calendar.component(.hour, from: date as Date)
            print(day)
            print(hour)
            
            let reference = Database.database().reference().child("\(userId)/activitys/\(datum)")

            
            let vluggeJapie = ["iconImage": ActivityInfo.activityInfo.iconImage,
                               "iconLabel": ActivityInfo.activityInfo.iconLabel,
                               "todo": ActivityInfo.activityInfo.todo,
                               "time": ActivityInfo.activityInfo.time,
                               "feeling": ActivityInfo.activityInfo.feeling,
                               "haveDone": ActivityInfo.activityInfo.haveDone]
                               as [String : Any]

            reference.updateChildValues(vluggeJapie)
        }
        
    }
    
    // sends the user back to the privious screen
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}

