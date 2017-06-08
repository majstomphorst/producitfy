//
//  SignInViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 08/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    @IBAction func signinButton(_ sender: Any) {
        
        let email = emailLabel.text!
        let password = passwordLabel.text!
        
        // signin the user in to there account with the information provided
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                
                // if a error happend this wil tell the user about it
                self.alertUser(title: "Sining in went wrong", message: error!.localizedDescription)
                
            } else {
                // when de user is signin the user is send to the messages view
                self.dismiss(animated: true, completion: nil)
                // self.performSegue(withIdentifier: "backToMessage", sender: nil)
            }
        }
        
    
    }


}
