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
    
    static let shared = Fire()
    
    private var userId = String()
    private var dataRef = Database.database().reference()
    private var storageRef = Storage.storage().reference()
    
    
    init() {
        self.userId = self.getUsderId()
        self.dataRef = Database.database().reference()
        self.storageRef = Storage.storage().reference()
    }
    
    // get the user's signin ID
    private func getUsderId() -> String {
        
        if let userId = Auth.auth().currentUser?.uid {
            return userId
        }
        
        return ""
    }
    
    func readDatabase(Where: String, what: Dictionary<String, String>) {
        
    }
    
    func writeDatabase() {
        
    }
    
    func StorePhoto(fileName: String, uploadData: UIImage) {
        
        let uploadData = UIImagePNGRepresentation(uploadData)
        
        let refference = storageRef.child(self.userId).child("\(fileName).png")
        
        refference.putData(uploadData!, metadata: nil, completion:
            { (metadata, error) in
                
                if error != nil {
                    print("upload error \(error!)")
                    return
                }
                
                // storing image succes
                DispatchQueue.main.async {
                    if let link = metadata?.downloadURL()?.absoluteString {
                        
                        let dataRef = self.dataRef.child(self.userId).child(fileName)
                        
                        let data = [fileName: link]
                        
                        
                        
                        
                    }
                }
                
                
        })
        
        
        
        
    }
    
    
    
}

