//
//  RegisterViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 08/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!


    @IBAction func backToSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        // collect information form form
        let email = emailLabel.text!
        let password = emailLabel.text!
        
        // this creates a user with the information in the register form
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            (user, error) in
            
            
            // if error display alert with error information
            if error != nil {
                self.alertUser(title: "Creating user went wrong",
                               message: error!.localizedDescription)
                return
            }
            
            print("created user!")
            // getting the curent userId
            guard let userId = user?.uid else {
                return
            }
            
            // creating a reference to where info is stored
            let reference = Database.database().reference().child("users")
                .child(userId)
            
            // create a dictionary with the information needed for registration
            let userInfo = ["email": email]
            
            // creats child with value userId and store userInfo under it
            reference.updateChildValues(userInfo, withCompletionBlock: {
                (error, reffrence) in
                
                if error != nil {
                    self.alertUser(title: "Saving user detials error",
                                   message: error!.localizedDescription)
                    return
                }
                
                print("done!")
                // when the user creation succeded send user to message view
                self.dismiss(animated: true, completion: nil)
            })
        })
    }
        
    }
    
    
    
    


