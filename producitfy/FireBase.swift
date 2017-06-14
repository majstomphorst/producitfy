//
//  FireBase.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 14/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import Foundation
import Firebase

class Fire {
    
    var userId = String()
    var dataRef = Database.database().reference()
    var StorageRef = Storage.storage().reference()
    
    // get the user's signin ID
    func getUsderId() {
        
        if let userId = Auth.auth().currentUser?.uid {
            self.userId = userId
        }
        
    }
    
    func readDatabase() {
        
    }
    
    func writeDatabase() {
        
    }
    
    func writeStorage() {
        
    }
    
    
    
}

