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
            
            let userid = Auth.auth().currentUser?.uid
            
            let name = self.activityNameLabel.text!
            
            let storeRef = Storage.storage().reference().child("\(userid!)/\(name).png")
            
            let uploadData = UIImagePNGRepresentation(image)
            
            storeRef.putData(uploadData!, metadata: nil, completion:
                { (metadata, error) in
                    
                    if error != nil {
                        print("uload error \(error!)")
                        return
                    }
                    
                    print(metadata as Any)
            })
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


