//
//  EditIconViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 14/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import Firebase

class EditIconViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var activityIconImage: UIImageView!
    @IBOutlet weak var activityNameLabel: UITextField!
    
    let henk = ["Piet", "Klaas Vaak"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func saveButton(_ sender: Any) {
        
        // Check if user gave me a activity name
        if activityNameLabel.text == "" {
            alertUser(title: "need a activity name Label", message: "Give me a label!")
            return
        }
        
        
        let userId = Auth.auth().currentUser?.uid
        
        let name = self.activityNameLabel.text!
        let image = activityIconImage.image
        
        let storeRef = Storage.storage().reference().child("\(userId!)/\(name).png")
        let databaseRef = Database.database().reference().child("preference").child(userId!)
        let uploadData = UIImagePNGRepresentation(image!)
        
        storeRef.putData(uploadData!, metadata: nil, completion:
            { (metadata, error) in
//                
                
                if error != nil {
                    print("upload error \(error!)")
                    return
                }
                
                DispatchQueue.main.async {
                    
                    let imageInfo = [name: metadata?.downloadURL()!.absoluteString]
                    
                    databaseRef.updateChildValues(imageInfo as! [String: String], withCompletionBlock: { (error, DatabaseReference) in
                        
                        if error != nil {
                            self.alertUser(title: "Saving image info detials error", message: error!.localizedDescription)
                            return
                        }
                        
                    })
                    
                    
                }
                
                
        })
        
        
        
        
        
    }
    
    @IBAction func handletap(recognizer: UITapGestureRecognizer) {
        
        // Create the action sheet
        let myActionSheet = UIAlertController(title: "Upload options", message: "How would you like to upload?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // blue action button
        let upload = UIAlertAction(title: "Upload From Camararoll", style: UIAlertActionStyle.default) { (action) in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            self.present(picker, animated: true, completion: nil)
            
        }
        
        // red action button
        let storages = UIAlertAction(title: "Pick one from the app", style: UIAlertActionStyle.default) { (action) in
            
            self.alertUser(title: "no implementation yet", message: "to bad")
        }
        
        // cancel action button
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            print("Cancel action button tapped")
        }
        
        // add action buttons to action sheet
        myActionSheet.addAction(upload)
        myActionSheet.addAction(storages)
        myActionSheet.addAction(cancel)
        
        // send user to the uiImage picerk view
        self.present(myActionSheet, animated: true, completion: nil)
        
    }
    
    // if a image is selected with the image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("print me!")
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            self.activityIconImage.image = image
        
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    

}

extension EditIconViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.henk.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as! EditIconTableViewCell
        
        cell.activityIconImage.image = UIImage(named: "Alien")
        cell.activityNameLabel.text = henk[indexPath.row]
        
        return cell
    }
    
    
}
