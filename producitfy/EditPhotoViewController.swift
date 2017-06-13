//
//  EditPhotoViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 12/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class EditPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityNameLabel: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imagePress(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        
        self.present(picker, animated: true, completion: nil)
        
        print("taptap")
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
            
            let userId = Auth.auth().currentUser?.uid
            
            let name = self.activityNameLabel.text!
            
            let storeRef = Storage.storage().reference().child("\(userId!)/\(name).png")
            
            let uploadData = UIImagePNGRepresentation(image)
            
            
            storeRef.putData(uploadData!, metadata: nil, completion:
                { (metadata, error) in
                    
                    if error != nil {
                        print("upload error \(error!)")
                        return
                    }
                    print("find me!")
                    print(userId!)
                    
                    
                    // creating a reference to where info is stored
                    let ref = Database.database().reference().child("preferene")
                    
                    if let meta = metadata?.downloadURL() {
                        
                        let imageInfo = [name : meta.description]
                        
                        // creats child with value userId and store userInfo under it
                        ref.child(userId!).setValue(imageInfo, withCompletionBlock: { (error, DatabaseReference) in
                            
                            if error != nil {
                                self.alertUser(title: "Saving image info detials error",
                                               message: error!.localizedDescription)
                                return
                            }
                            
                        })
                        
                    }

            })
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


