//
//  EditIconViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 14/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

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
        
        
    }
    
    @IBAction func handletap(recognizer: UITapGestureRecognizer) {
        
        // Create the action sheet
        let myActionSheet = UIAlertController(title: "Upload options", message: "How would you like to upload?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // blue action button
        let upload = UIAlertAction(title: "Upload From Camararoll", style: UIAlertActionStyle.default) { (action) in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            self.present(picker, animated: true, completion: nil)
            
            print("Upload From Camararoll")
        }
        
        // red action button
        let storages = UIAlertAction(title: "Pick one from the app", style: UIAlertActionStyle.default) { (action) in
            print("Pick one from the app")
        }
        
        // cancel action button
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            print("Cancel action button tapped")
        }
        
        // add action buttons to action sheet
        myActionSheet.addAction(upload)
        myActionSheet.addAction(storages)
        myActionSheet.addAction(cancel)
        
        self.present(myActionSheet, animated: true, completion: nil)
        
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
