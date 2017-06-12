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
    @IBOutlet weak var haveDoneField: UITextField!
    
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
        ActivityInfo.activityInfo.haveDone = haveDoneField.text!
        
        if let userId = Auth.auth().currentUser?.uid {
            
            let date = NSDate()
            let calendar = NSCalendar.current
            
            
            
            let hours = calendar.component(.hour, from: date as Date)
            let minutes = calendar.component(.minute, from: date as Date)
            let seconds = calendar.component(.second, from: date as Date)
            let day = calendar.component(.day, from: date as Date)
            let month = calendar.component(.month, from: date as Date)
            let year = calendar.component(.year, from: date as Date)
            let week = calendar.component(.weekOfYear, from: date as Date)
            
            let datum = String(format: "%02i:%02i:%02i:%02i:%02i:%02i:%04i"
                , hours, minutes, seconds, day, week, month, year)
            
            
            
            let reference = Database.database().reference().child("\(userId)/\(datum)")

            
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

